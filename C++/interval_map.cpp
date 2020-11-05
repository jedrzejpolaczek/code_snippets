#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <limits>
#include <algorithm>

using namespace std;

template<typename K, typename V>
class interval_map {
    std::map<K,V> m_map;

    public:
    interval_map(V const& val){
        m_map.insert(m_map.end(), std::make_pair(std::numeric_limits<K>::lowest(), val));
        print();
    }

    void assign(K const& keyBegin, K const& keyEnd, V const& val){

        auto elementsInRange = std::find_if(m_map.begin(), m_map.end(), [&](auto& element){
              return keyBegin <= std::get<0>(element);
         });
         //Input range is larger than all existing elements.
         if(elementsInRange == m_map.end())
         {
             m_map.insert(std::make_pair(keyBegin, val));
             m_map.insert(std::make_pair(keyEnd, val));
         }
         //Input range overlaps existing elements.
         else
         {
            auto elementsAfterRange = std::find_if(elementsInRange, m_map.end(), [&](auto& element){
              return keyEnd < std::get<0>(element);
            });
            //Input range intersects existing range.
            if(elementsAfterRange == m_map.end())
            {
                //Remove existing intersecting elements.
                m_map.erase(elementsInRange, m_map.end());
                m_map.insert(std::make_pair(keyBegin, val));
                m_map.insert(std::make_pair(keyEnd, val));
            }
            //Input range is inside existing range.
            else
            {
                //remove existing elements inside input range.
                m_map.erase(elementsInRange, elementsAfterRange);
                m_map.insert(std::make_pair(keyBegin, val));
                m_map.insert(std::make_pair(keyEnd, std::get<1>(*elementsAfterRange)));
            }            
         }        
        
        print();
    }

    V const& operator[](K const& key) const {
        return ( --m_map.upper_bound(key) )->second;
    }

    private:

    void print()
    {
        cout << "Private members: (m_map):\n";
        for(const auto& element : m_map)
        {
            cout << std::get<0>(element) << "\t" << std::get<1>(element) << "\n";
        }
        cout << "Public members:\n";
        for(unsigned i = 0; i <= std::get<0>(*(m_map.rbegin())); i++)
        {
            cout << (*this)[i] << "\t";
        }
        cout << "\n\n";
    }
};


int main()
{
    interval_map<unsigned,char> imap('A');
    imap.assign(5, 20, 'B');
    imap.assign(10, 25, 'C');
    imap.assign(10, 15, 'D');
    imap.assign(20, 25, 'E');
    cout << endl;
}