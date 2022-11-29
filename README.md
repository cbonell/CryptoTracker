# Welcome to MoonTrading!

## Description
MoonTrading is a platform that aims to assist users with understanding how to trade in the crypto market through paper-trading. Allowing users to perform paper trades with imaginary currency to prevent actual money loss during the learning phase. Moon Trading has complimentary Machine Learning price prediction models to assist with trading decisions. 

## Setup
It is recomended that you use Visual Studio 2022 IDE which can be downloaded from [here](https://visualstudio.microsoft.com/vs/)

 First make sure that you have the required .NET version by running the below command from in a Windows Terminal (can also use Command Prompt, PowerShell, etc.)
 
 ```bash
 dotnet --version
 ```
 
 If you have at least 6.0.X than you my proced or you can download the .NET 6 SDK from [here](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
 
 Now you can clone the project from the command line or easily with Git tools built into Visual Studio 2022
 
 ## Project Details
 
 ### MoonTrading
UI for the project which utilizes [Blazor Server](https://docs.microsoft.com/en-us/aspnet/core/blazor/hosting-models?view=aspnetcore-6.0)
 
 ### MoonTrading.BusinessLogic
Serves as the source for a majority of logic contained in the application.

 ### MoonTrading.DataAccess
 Class Library which serves as the data access layer that uses the Dapper library to perform all SQL access.  Additionally, access to external API's are handled within this project.
 
  ### MoonTrading.DataBase
 A [SQL Server Database Project](https://stackoverflow.com/a/63044068) used to easily manage schema of the database used by the app. Additionally, it provides the ability to keep schema changes within source control
 
 ### MoonTrading.DataModels
 Class Library which holds all models for the database and external api data.
 
### MoonTrading.Tests
Project to contain all [Unit Tests](https://docs.microsoft.com/en-us/visualstudio/test/walkthrough-creating-and-running-unit-tests-for-managed-code?view=vs-2022) within the application

### MoonTrading.Tools
Contains tools used throughout the application such constants and extension methods.
