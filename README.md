# Welcome to CryptoTracker!

## Description
Desctiption text

## Setup
It is recomended that you use Visual Studio 2022 IDE which can be downloaded from [here](https://visualstudio.microsoft.com/vs/)

 First make sure that you have the required .NET version by running the below command from in a Windows Terminal (can also use Command Prompt, PowerShell, etc.)
 
 ```bash
 dotnet --version
 ```
 
 If you have at least 6.0.X than you my proced or you can download the .NET 6 SDK from [here](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
 
 Now you can clone the project from the command line or easily with Git tools built into Visual Studio 2022
 
 ## Project Details
 
 ### CryptoTracker.DataAccess
 Class Library which serves as the data access layer that uses the Dapper library to perform all SQL access.  Additionally, RestClient library is used to call the CoinMarketCap API endpoints.
 
 ### CryptoTracker.Db
 A [SQL Server Database Project](https://stackoverflow.com/a/63044068) used to easily manage schema of the database used by the app. Additionally, it provides the ability to keep schema changes within source control

### CryptoTracker.Tests
Project to contain all [Unit Tests](https://docs.microsoft.com/en-us/visualstudio/test/walkthrough-creating-and-running-unit-tests-for-managed-code?view=vs-2022) within the application

### CryptoTracker.Web
UI for the project which utilizes [Blazor Server](https://docs.microsoft.com/en-us/aspnet/core/blazor/hosting-models?view=aspnetcore-6.0)
