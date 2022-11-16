using MoonTrading.Tests.DbAccess;

namespace MoonTrading.Tests.Data;
public class DataBase : IDataBase
{
    internal readonly ISqlDataAccess _db;

    public DataBase(ISqlDataAccess db)
    {
        _db = db;
    }
}
