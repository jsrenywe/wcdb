/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "WTCWINQTestCase.h"

@interface WTCStatementDropTableTests : WTCWINQTestCase

@end

@implementation WTCStatementDropTableTests

- (void)testStatementDropTable
{
    XCTAssertEqual(WCDB::StatementDropTable().getType(), WCDB::Statement::Type::DropTable);

    WINQAssertEqual(WCDB::StatementDropTable()
                        .dropTable(self.class.tableName, true)
                        .withSchema(self.class.schemaName),
                    @"DROP TABLE IF EXISTS testSchema.testTable");

    WINQAssertEqual(WCDB::StatementDropTable()
                        .dropTable(self.class.tableName, true),
                    @"DROP TABLE IF EXISTS testTable");

    WINQAssertEqual(WCDB::StatementDropTable()
                        .dropTable(self.class.tableName, false)
                        .withSchema(self.class.schemaName),
                    @"DROP TABLE testSchema.testTable");

    //Default
    WINQAssertEqual(WCDB::StatementDropTable()
                        .dropTable(self.class.tableName)
                        .withSchema(self.class.schemaName),
                    @"DROP TABLE IF EXISTS testSchema.testTable");
}

@end
