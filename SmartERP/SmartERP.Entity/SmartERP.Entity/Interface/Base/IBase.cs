using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Entity.Interface
{
    public interface IBase<T>
    {
        List<T> GetAll();
        T Get(int id);
        int Insert(T obj);
        bool Update(T obj);
        bool Delete(T obj);
    }
}
