Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB044790A
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 05:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HncrB3d1fz2ymr
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 15:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=URd3pNps;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=59469fcd6c=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=URd3pNps; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hncqf6nx2z2xT9
 for <openbmc@lists.ozlabs.org>; Mon,  8 Nov 2021 15:01:32 +1100 (AEDT)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A80Nsp8025556
 for <openbmc@lists.ozlabs.org>; Mon, 8 Nov 2021 04:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=A24E4P4m+2bVD6Bf6765As73APIoWy1XfUDBCuAOSBs=;
 b=URd3pNps4tBOZ6e+TZ+LLJ1cbQwOUYpQS/hUgO6nmWkL/Pq+lBH+1c/nQPf1dBMcR5AJ
 mQyeugLbHeb97wJeRNf1he+z0j22KSR8Xz4Qu8DX9ibrkEnVDNwLD2QXU0lLzi+yDebx
 5gsRtNZPpY9GuE+8DH43EdA+ZU9n0SyMzsGLvDb+RUjayXNW0hMtscjOdyP7mN64snVV
 0FpG2Z+ud+0QUi08crhzeFTnLXCZMn4IJJGKvE5W0BHzvHqU1wMQmVvTptuCH+6B81eV
 Lz1pAYfN0TaW9LqgR3IyZvTYBtrbki9dHnoiyuRta4sQLjU/bgYu+u97QhKR5PkQ8u75 6Q== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by mx08-002d6701.pphosted.com with ESMTP id 3c5g2e6tc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 08 Nov 2021 04:01:27 +0000
Received: from BN6PR16CA0012.namprd16.prod.outlook.com (2603:10b6:404:f5::22)
 by BN7PR08MB4977.namprd08.prod.outlook.com (2603:10b6:408:28::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 04:01:24 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::18) by BN6PR16CA0012.outlook.office365.com
 (2603:10b6:404:f5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 04:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.89)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.89 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.89; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.89) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 04:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dd0Ubgj+kw9cJzpILOFJXswAwazk5WkWkvyxQYxiQ38Lmsyj065cIeURY4kGwNIyYiw9u3XRp8D6o5K5fZ7RUeXsc+t8oI62zvDkw9zNp9rcOS6m1KbjIbq3C7/7XtswVZdaivGelplpG6M9b2zco5s3s45yWw5+1Uf55yyJ+qzl4TqH5TcCVNiBvKJju7dRSl40MlmlRoqORzni4dtv/Fl5JTVLMAQEoEF6jBRRDpfqf+EGZyPjFRrfH3pxGCBkdo7ThnAokSlVZFjkiSlH16IgWxFgiAn0R1paRXH2MDADX81BDG3buG9NCtIrvVFUICsZ1sDna3oNHSSniP7heQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuN2gR/i7VZcl07PA3+d9Fi1fDG38o1aus6JnzmIVLs=;
 b=j8DllaJ1QhRrzylYitwgmA3Zr4RfjDkGAR7HSr2SQkS81wlDTXDjMAYhJETIPTDOsYY39vimaaMw1fLDAMQ4yrL2tS+RNJ1eVYHTvivbNmwJO/1UzjXMEIj/W4XJgo0jmydVokcBrkOpvG2ljGVM5zIVWd4fZtm34vbF8QIV6Nn3DE7N0Vdlr1pIepi8wQVl2MxYoCORhyRAxV4vLApCd22G4woHpaPihTn3NqUlPlHroEUA/hmwymhFultt4LarQXal6pNOwGq91Yv0BDVWTvmG4+mRJG61/Pz+Vvs7TNQCXlILEqq1As0mSLT/oqJUo5ciJWJSpL4iH0NDKzX2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM5PR08MB2458.namprd08.prod.outlook.com (2603:10b6:3:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 04:01:21 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 04:01:21 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-host-ipmid] Question about IPMI SDR
Thread-Topic: [phosphor-host-ipmid] Question about IPMI SDR
Thread-Index: AQHX1FMVcHHdqMI4+UCvhvFgn3/gJg==
Date: Mon, 8 Nov 2021 04:01:21 +0000
Message-ID: <DM6PR08MB551412A7CBCEDFAA6D76C495DC919@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: d5a025c5-d060-7f19-4ddc-1027e11cea47
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 57f31b2c-ed61-4c5b-5e09-08d9a26c6dfb
x-ms-traffictypediagnostic: DM5PR08MB2458:|BN7PR08MB4977:
X-Microsoft-Antispam-PRVS: <BN7PR08MB49775D1C1AC10AD0F344FED5DC919@BN7PR08MB4977.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: CgbjlUhhD4Fzja9shtn9mGts1ZLeLdrZfuXm2LBaz9jn57LIgz+OBkk4w3hvhyj8aLXtOlU5FUqsdgfLPhKAkoP9gBZn3YodaYpn2OW6UH6E3ZmgFqHvdGYldcZlOiPLNq1pa9/mmnxddJj833eLn4PnOr8az7NXOR/JHltmmNokOlOO5F5KKkSpTAgmbAfuQu6jW5fGKBcpD3i8tqZAu8ClS0p9JM4pKbpP//ggXJVuf6UyfwwFuGNBDx9t4jMfMddLlixvypEt8kcwF7tulJgfI+p9iPg14bsy2xzs2MZ+whItj5Az4DWfnWNDFkP/jFqvhAiZedvn7PRDqP+HAkNjgTHxiVD0mYq7wiuunFsdkTFjAZA+sM+KpkXBlJ7c5KO+LU4UaF0TTE4gSG9QNFrVN/tbnQIWuU/ONdVE22PGt0j9HE34D8m0JUwEdZARrw4XrhL6IbgwplIRFqSaImwtBzrczaMS17JmH+K1LSaAEaRCwzzR2Q4hhc6IyRSS1QWy7PYIsAJ5euj9T3fShVlA5rRQ8TQNowQBiQmNkVDIeiY8Y3biIoxkWAfGupsG8hKTmOgtzdkVqAO4Bsv6iBre7XzZaixa60uE4E/FaZGSIHps3xdxRE586wqDIfL8mGUPeZ6t7mIOGg3Rhqg+eZ1xcZ7Xm3bFW4YA5GnHBROvTHD0l7KiGLMZ4hEHDE7HCWy39XGaYPa3TxnyH9Z3YQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(6506007)(55016002)(86362001)(8936002)(2906002)(5660300002)(33656002)(71200400001)(52536014)(7696005)(8676002)(9686003)(83380400001)(6916009)(66946007)(91956017)(76116006)(19627405001)(38070700005)(66476007)(66446008)(64756008)(66556008)(316002)(186003)(508600001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB551412A7CBCEDFAA6D76C495DC919DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2458
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: be0c49b9-54f2-41b5-2c10-08d9a26c6cec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8OSmJCzyivlMH/QfLhgdcZL4oklLYTjoBMJP7Oo1UnEjLLIgwCG4QgEiZaOrs9M1hQJHS9mm5/jxh1JgPDRKyTzlTjfct0PwFGTWFy1TibSGVF+2x0F4BxJ8ll1LP67ZVfOroJBc+IMLSw25EQKTG5JN/QP+SdUpXKT2J0fJeQErvBUODrRJh/WHKL9foSnyiP1Dx5P53n1YdF7Ys8wa2o5S+caDemDztJVNXJRr3/FfwgPV3F7B4c9MrA1+LrR9lQEO1iNX7/THNJGGLUWMcotclSltiRRXu3wxEx0dXcOgSlPJgO23r6Nfr+Cbr6iJ4zsGDsZ/lYiYTAEGGM9GWA/PSeC4TRjsZO+1zC/MTWg17bSx7Q8fMDJ/F7+QiDcNtd+4RQD3QRtX84jW0tw5SBNZMV0KVIKH5/0zYP4U1WIutLi7yGwItHNCHLGawgetU7SYTV5b+0pEX0v2dx8Diq+p7MTkISAh8Pb5GbzeQQCIegbH2Jq2tiD2J+tgRVMGHhIyeEIv8syWHb9kMAnEuZtZ3PXF/FTrnt1CTNYgqDeIZm3wcc+74sph8bk0f7JMJ927bz7yXubA02XTldvkIYqNjh6B+xnSByQP7hrKw9qaFlmDSv581CEOJGHY/il0sMDKTZ0dPJEgciLp8q9Z3GfiMLjvoSd5qN5XgCgZOkswSeoGIrWc2S1rpS2c+yTE/Vtaw5dEONSGb284bShflkXRHJDMtJ01IReHdbrKPvw=
X-Forefront-Antispam-Report: CIP:144.49.247.89; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(82310400003)(4186021)(316002)(508600001)(2906002)(186003)(26005)(19627405001)(9686003)(8936002)(33656002)(55016002)(83380400001)(336012)(356005)(86362001)(7696005)(52536014)(36860700001)(6506007)(70206006)(81166007)(5660300002)(70586007)(6916009)(8676002)(47076005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 04:01:23.3534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f31b2c-ed61-4c5b-5e09-08d9a26c6dfb
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.89];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4977
X-Proofpoint-ORIG-GUID: VN-vdlk-kFnlmzpz5_RLEkOUd2SN1Etf
X-Proofpoint-GUID: VN-vdlk-kFnlmzpz5_RLEkOUd2SN1Etf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=803 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080026
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB551412A7CBCEDFAA6D76C495DC919DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgYWxsLA0KDQpXZSBoYXZlIGFkZGVkIDMgdGVtcCBzZW5zb3JzIGJ5IHVzaW5nIGVudGl0eS1t
YW5hZ2VyLCBhbmQgbG9va3MgbGlrZSB3ZSBjYW4gbGlzdCB0aGVtIHdpdGggdGVtcCB2YWx1ZSBy
ZWFkaW5nIHN1Y2Nlc3NmdWxseSBhcyBiZWxvdy4NCj09PT09DQpyb290QGh1ZHNvbmJheS1vYm1j
On4jIGlwbWl0b29sIHNkciBlbGlzdA0KQk1DICAgICAgICAgICAgICB8IDAwaCB8IG9rICB8ICA3
LjEgfCAyNyBkZWdyZWVzIEMNCkRJTU0gUDAgQUJDRCBQMSAgfCAwMWggfCBvayAgfCAgNy4xIHwg
MzUgZGVncmVlcyBDDQpESU1NIFAxIEVGR0ggICAgIHwgMDJoIHwgdWNyIHwgIDcuMSB8IDQwIGRl
Z3JlZXMgQw0KR2V0IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlkIGRhdGEgZmllbGQg
aW4gcmVxdWVzdA0KR2V0IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlkIGRhdGEgZmll
bGQgaW4gcmVxdWVzdA0KR2V0IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlkIGRhdGEg
ZmllbGQgaW4gcmVxdWVzdA0KR2V0IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlkIGRh
dGEgZmllbGQgaW4gcmVxdWVzdA0KR2V0IFNEUiAwMDAzIGNvbW1hbmQgZmFpbGVkOiBJbnZhbGlk
IGRhdGEgZmllbGQgaW4gcmVxdWVzdA0Kcm9vdEBodWRzb25iYXktb2JtYzp+Iw0KPT09PT0NCg0K
SG93ZXZlciwgdGhlcmUgaXMgYSBraW5kIG9mIGVycm9yIG1lc3NhZ2UgIkdldCBTRFIgMDAwMyBj
b21tYW5kIGZhaWxlZDogSW52YWxpZCBkYXRhIGZpZWxkIGluIHJlcXVlc3QiIGFsd2F5cyBiZWVu
IHNob3duIGJlaGluZCBpdC4gSSB0YWtlIGEgbG9vayBhdCBpdCB2aWEgam91cm5hbCBsb2cgaW4g
T3BlbkJNQyB3aGF0IGVycm9yIGl0IGlzLiBUaGF0IGlzOg0KPT09PT0NCkphbiAwMSAwMDowMToy
NCBodWRzb25iYXktb2JtYyBpcG1pZFsxNTddOiBHZXRNYW5nYWdlZE9iamVjdHMgZm9yIGdldFNl
bnNvck1hcCBmYWlsZWQNCkphbiAwMSAwMDowMToyNCBodWRzb25iYXktb2JtYyBpcG1pZFsxNTdd
OiBnZXRTZW5zb3JEYXRhUmVjb3JkOiBnZXRTZW5zb3JNYXAgZXJyb3INCkphbiAwMSAwMDowMToy
NCBodWRzb25iYXktb2JtYyBpcG1pZFsxNTddOiBpcG1pU3RvcmFnZUdldFNEUjogZmFpbCB0byBn
ZXQgU0RSDQoNCnJvb3RAaHVkc29uYmF5LW9ibWM6fiMgam91cm5hbGN0bCAtbyBqc29uLXByZXR0
eSBNRVNTQUdFPSJHZXRNYW5nYWdlZE9iamVjdHMgZm9yIGdldFNlbnNvck1hcCBmYWlsZWQiDQp7
DQogICAgICAgICJfQk9PVF9JRCIgOiAiZDkzMmFiNjQ5MzU5NDNjMWI5Mzc5OTNiM2Q0YzA1MTAi
LA0KICAgICAgICAiX19SRUFMVElNRV9USU1FU1RBTVAiIDogIjg0OTAzOTg3IiwNCiAgICAgICAg
Il9TWVNURU1EX0NHUk9VUCIgOiAiL3N5c3RlbS5zbGljZS9waG9zcGhvci1pcG1pLWhvc3Quc2Vy
dmljZSIsDQogICAgICAgICJQUklPUklUWSIgOiAiMyIsDQogICAgICAgICJfQ0FQX0VGRkVDVElW
RSIgOiAiMWZmZmZmZmZmZmYiLA0KICAgICAgICAiQ09ERV9GVU5DIiA6ICJoZWxwZXJfbG9nIiwN
CiAgICAgICAgIl9TWVNURU1EX1VOSVQiIDogInBob3NwaG9yLWlwbWktaG9zdC5zZXJ2aWNlIiwN
CiAgICAgICAgIl9TWVNURU1EX1NMSUNFIiA6ICJzeXN0ZW0uc2xpY2UiLA0KICAgICAgICAiX1VJ
RCIgOiAiMCIsDQogICAgICAgICJfSE9TVE5BTUUiIDogImh1ZHNvbmJheS1vYm1jIiwNCiAgICAg
ICAgIk1FU1NBR0UiIDogIkdldE1hbmdhZ2VkT2JqZWN0cyBmb3IgZ2V0U2Vuc29yTWFwIGZhaWxl
ZCIsDQogICAgICAgICJfX01PTk9UT05JQ19USU1FU1RBTVAiIDogIjg0OTAzOTkyIiwNCiAgICAg
ICAgIl9NQUNISU5FX0lEIiA6ICIzZTU1YTY5Mjg2MmU0YWNmYmZlYzE5NTZkYjBkMGVlMCIsDQog
ICAgICAgICJfU1lTVEVNRF9JTlZPQ0FUSU9OX0lEIiA6ICIyMGVlYmZiM2E3MDE0NTJlYmZjMjI2
MTE3YjJjYmJlOSIsDQogICAgICAgICJTWVNMT0dfSURFTlRJRklFUiIgOiAiaXBtaWQiLA0KICAg
ICAgICAiX1RSQU5TUE9SVCIgOiAiam91cm5hbCIsDQogICAgICAgICJFUlJPUiIgOiAiSW52YWxp
ZCByZXF1ZXN0IGRlc2NyaXB0b3IiLA0KICAgICAgICAiX1BJRCIgOiAiMTU3IiwNCiAgICAgICAg
Il9fQ1VSU09SIiA6ICJzPTJkMGVlYmYwNjVkMjRiN2ZiYTVhMjRhNjcwZDJmZmJmO2k9MzBkO2I9
ZDkzMmFiNjQ5MzU5NDNjMWI5Mzc5OTNiM2Q0YzA1MTA7bT01MGY4ODM4O3Q9NTBmODgzMzt4PWRl
ZmMyM2I4N2FmOGUyOWIiLA0KICAgICAgICAiVFJBTlNBQ1RJT05fSUQiIDogIjM1MjQ0NzM2Njki
LA0KICAgICAgICAiQ09ERV9MSU5FIiA6ICI3NiIsDQogICAgICAgICJDT0RFX0ZJTEUiIDogIi91
c3Ivc3JjL2RlYnVnL2ludGVsLWlwbWktb2VtLzAuMStnaXQ5OTktcjAvcmVjaXBlLXN5c3Jvb3Qv
dXNyL2luY2x1ZGUvcGhvc3Bob3ItbG9nZ2luZy9sb2cuaHBwIiwNCiAgICAgICAgIl9TT1VSQ0Vf
UkVBTFRJTUVfVElNRVNUQU1QIiA6ICI4NDkwMzk1MCIsDQogICAgICAgICJfRVhFIiA6ICIvdXNy
L2Jpbi9pcG1pZCIsDQogICAgICAgICJfR0lEIiA6ICIwIiwNCiAgICAgICAgIl9DT01NIiA6ICJp
cG1pZCIsDQogICAgICAgICJfQ01ETElORSIgOiAiaXBtaWQiDQp9DQo9PT09PQ0KDQpJIGhhdmUg
dHJpZWQgdG8gZmlndXJlIG91dCBpdCBidXQgd2l0aCBsaW1pdGVkIGNhcGFiaWxpdHksIGNhbiBz
b21lb25lIGhlbHAgdG8gcHJvdmlkZSBzb21lIHN1Z2dlc3Rpb25zIGZvciBtZT8gSSBtZWFuIGhv
dyB0byBmaXggaXQsIG9yIEknbSBhYmxlIHRvIGlnbm9yZSBpdCBiZWNhdXNlIHRoZSBTRFIgaGFz
IGJlZW4gbGlzdGVkPw0KDQpUaGFuayB5b3UuDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoKTGVn
YWwgRGlzY2xhaW1lciA6ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdl
IG1heSBiZSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwuIApJdCBpcyBpbnRlbmRlZCB0byBi
ZSByZWFkIG9ubHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQgaXMgYWRk
cmVzc2VkIApvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3Nh
Z2UgaXMgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIAp5b3UgYXJlIG9uIG5vdGljZSB0aGF0
IGFueSBkaXN0cmlidXRpb24gb2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwgCmlzIHN0cmlj
dGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBpbiBlcnJv
ciwgCnBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIG9yIGRl
c3Ryb3kgYW55IGNvcHkgb2YgdGhpcyBtZXNzYWdlIQo=

--_000_DM6PR08MB551412A7CBCEDFAA6D76C495DC919DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We have added 3 temp sensors by using entity-manager, and looks like we can=
 list them with temp value reading successfully as below.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# ipmitool sdr elist
<div>BMC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 00h | ok &nbsp;|=
 &nbsp;7.1 | 27 degrees C</div>
<div>DIMM P0 ABCD P1 &nbsp;| 01h | ok &nbsp;| &nbsp;7.1 | 35 degrees C</div>
<div>DIMM P1 EFGH &nbsp; &nbsp; | 02h | ucr | &nbsp;7.1 | 40 degrees C</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
<div>Get SDR 0003 command failed: Invalid data field in request</div>
root@hudsonbay-obmc:~#<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt">=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
However, there is a kind of error message &quot;Get SDR 0003 command failed=
: Invalid data field in request&quot; always been shown behind it. I take a=
 look at it via journal log in OpenBMC what error it is. That is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: GetMangagedObjects for getSensor=
Map failed
<div>Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: getSensorDataRecord: getSen=
sorMap error</div>
Jan 01 00:01:24 hudsonbay-obmc ipmid[157]: ipmiStorageGetSDR: fail to get S=
DR<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# journalctl -o json-pretty MESSAGE=3D&quot;GetMangage=
dObjects for getSensorMap failed&quot;
<div>{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_BOOT_ID&quot; : &quot;d932ab6493594=
3c1b937993b3d4c0510&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__REALTIME_TIMESTAMP&quot; : &quot;8=
4903987&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_CGROUP&quot; : &quot;/syste=
m.slice/phosphor-ipmi-host.service&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;PRIORITY&quot; : &quot;3&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_CAP_EFFECTIVE&quot; : &quot;1ffffff=
ffff&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_FUNC&quot; : &quot;helper_log&q=
uot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_UNIT&quot; : &quot;phosphor=
-ipmi-host.service&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_SLICE&quot; : &quot;system.=
slice&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_UID&quot; : &quot;0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_HOSTNAME&quot; : &quot;hudsonbay-ob=
mc&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;MESSAGE&quot; : &quot;GetMangagedObj=
ects for getSensorMap failed&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__MONOTONIC_TIMESTAMP&quot; : &quot;=
84903992&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_MACHINE_ID&quot; : &quot;3e55a69286=
2e4acfbfec1956db0d0ee0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SYSTEMD_INVOCATION_ID&quot; : &quot=
;20eebfb3a701452ebfc226117b2cbbe9&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;SYSLOG_IDENTIFIER&quot; : &quot;ipmi=
d&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_TRANSPORT&quot; : &quot;journal&quo=
t;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;ERROR&quot; : &quot;Invalid request =
descriptor&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_PID&quot; : &quot;157&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;__CURSOR&quot; : &quot;s=3D2d0eebf06=
5d24b7fba5a24a670d2ffbf;i=3D30d;b=3Dd932ab64935943c1b937993b3d4c0510;m=3D50=
f8838;t=3D50f8833;x=3Ddefc23b87af8e29b&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;TRANSACTION_ID&quot; : &quot;3524473=
669&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_LINE&quot; : &quot;76&quot;,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;CODE_FILE&quot; : &quot;/usr/src/deb=
ug/intel-ipmi-oem/0.1+git999-r0/recipe-sysroot/usr/include/phosphor-logging=
/log.hpp&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_SOURCE_REALTIME_TIMESTAMP&quot; : &=
quot;84903950&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_EXE&quot; : &quot;/usr/bin/ipmid&qu=
ot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_GID&quot; : &quot;0&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_COMM&quot; : &quot;ipmid&quot;,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &quot;_CMDLINE&quot; : &quot;ipmid&quot;</=
div>
}<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have tried to figure out it but with limited capability, can someone help=
 to provide some suggestions for me? I mean how to fix it, or I'm able to i=
gnore it because the SDR has been listed?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB551412A7CBCEDFAA6D76C495DC919DM6PR08MB5514namp_--
