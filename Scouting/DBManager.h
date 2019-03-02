//
//  DBManager.h
//  Scouting
//
//  Created by Adam Schor on 2/23/19.
//  Copyright © 2019 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
NS_ASSUME_NONNULL_BEGIN

@interface DBManager : NSObject


-(instancetype)initWithDatabaseFilename:(NSString *)dbFileName;

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *databaseFilename;

-(void)copyDatabaseIntoDocumentsDirectory;

@property (nonatomic, strong) NSMutableArray *arrResults;
-(void)runQuery: (const char*)query isQueryExecutable: (BOOL)queryExectutable;

@property (nonatomic, strong) NSMutableArray *arrColumnNames;

@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(NSMutableArray *)loadDataFromDB:(NSString *)query;

-(void)executeQuery:(NSString *)query;


@end

NS_ASSUME_NONNULL_END
