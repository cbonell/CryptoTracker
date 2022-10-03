using CryptoTracker.DataAccess.DbAccess;

namespace CryptoTracker.DataAccess.Data;
public class DataBase : IDataBase
{
    internal readonly ISqlDataAccess _db;

    public DataBase(ISqlDataAccess db)
    {
        _db = db;
    }
}
