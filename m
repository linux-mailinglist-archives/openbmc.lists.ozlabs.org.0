Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85B349777
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 17:59:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5rtP34xgz3bcN
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 03:59:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=aHjfX8QR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=prashanth.giri@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=aHjfX8QR; dkim-atps=neutral
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5rt64WDSz30GS
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 03:59:07 +1100 (AEDT)
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PGrEYi025319
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 12:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Q5ejlOFfo6hGbMm0V6jny8N71IfgK5/RCjJPm8vmqRI=;
 b=aHjfX8QRFHC0Vj32nW4CMPFiyuQmkXQGGaPIJnQMhSupwgDWq/MOQEh128LsrEcZz5nm
 Xxeh9yYKyrT0wcZYlQSnOuM/D1OHBVTTuzQB8mslSzGosR8hmANRT3oXCTnPsM+0Ib4z
 xgs6lGt8A6Bz1kDfJcpwaaQ5+3k1npv/yd1sDXNtLlFIDJ7zHOs/9KpWG+jl5qZ/2TOh
 PG/ACinpF2A6JZDmFsAqhKDRFcxn1LOQGIUhGX65cwZX1yBvwQp6WBcAmyFi0MEkNk0B
 WXNK0/OBH7dCllaaRooMTX4M51z04zkdv0Lf73nMg+3rK0wpAhX4gRmqPJkSrEws7gDD EA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37dd2kb15t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 12:59:05 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PGteEn149037
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 12:59:05 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
 by mx0a-00154901.pphosted.com with ESMTP id 37dx0mp1gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 12:59:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+sE8PQIYvgZ4+Il39jhWZvw8+gpQ88q9Qr9yF1+yoU93LQ/0EMDMMeycH02uatdVKGtpufbnwrQPrfTFT0ichfjbUh1MnnuH87ap87tPAKh4/9YZYTaL+tqdFevfg6QuYgy27qezGwwOCxeGcy0AKiTCdqUyDRlgsHqY5eu4wgD3tlhcC96WchS6/1vATq9+vXNJGRPawb8g7RXxp9Co6gPnHzdA4+uAEP8ofAloUJxF/zTmrnXc4THM4jUYfgTjhTZrzu3Rq0narECjWBpnaubY7D3sN+ytezPE/cqzfGnQjsRdl6cYfiqXJc6l0fqGJfjJK7mwv240O7s1mi6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ejlOFfo6hGbMm0V6jny8N71IfgK5/RCjJPm8vmqRI=;
 b=d/E6lDH/icRqHJHmsscAyQ+WyVUu1K0fII1XhXmncUNkqC1S+R6e9dtZewGz0fDHbX5SZ2Lbf8TWP9inMuxQMus+shKccY+p2+uBTUPly2ifQaJioCUUViTo/kzfmCG3fuhqvfKaUv5tdoilKLgJKD4z8NljwbtSRP84Z80kA8+ufBijwIFzyNBAlfieHeC8QDyrIqH+mQUd4z/vpjIXze5tQ4sQLKlVTGHsG7po2OATx9tnnmYX/p3BB1ACyJX0HPcJaYalPY5wEsmeYuvbgKWAxl+BYVZlgszJZ2R/WfWOXF44OnI1wCA25Ce7J8ll7DFR8inD/i8qTYBBnhCcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3417.namprd19.prod.outlook.com (2603:10b6:5:18d::30)
 by DM5PR19MB0923.namprd19.prod.outlook.com (2603:10b6:3:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 16:59:03 +0000
Received: from DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3]) by DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3%6]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 16:59:03 +0000
From: "Giri, Prashanth" <Prashanth.Giri@dell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: License of generated code by sdbus++
Thread-Topic: License of generated code by sdbus++
Thread-Index: Adcg8CNwtb6flRC2TFKefB3mCSU/7AAp5KoA
Date: Thu, 25 Mar 2021 16:59:03 +0000
Message-ID: <DM6PR19MB3417AD45FACB8BCBA4563EA895629@DM6PR19MB3417.namprd19.prod.outlook.com>
References: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prashanth_Giri@Dell.com; 
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-24T20:54:59.6244127Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=76f77ab5-9071-418b-864c-bf8d853fc29c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [65.36.111.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0d7a043-dd78-4868-b5e6-08d8efaf4b8d
x-ms-traffictypediagnostic: DM5PR19MB0923:
x-microsoft-antispam-prvs: <DM5PR19MB09238CEDD3BF631A671B132095629@DM5PR19MB0923.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nDDO6pFkbVobO9TSvLkzdbkJPmQDXSBFoMXVbsY0KhnPPXS1+xjtmKs+mxTPi9ZsutioOcvtZ2dxYjotzo0RTPcjG7g4qb0lj8XryF0BgB9q9mmKrvrtS1WUvAi3gToV6/ZT1A+TB2nAe05BnMaf3tOfsSYKwZlcnvQ34pgCM3Z/vtj7pjLU2k6y5xSpD5C23uQbuuXEqlPSeK/UTTf9kNFu74+V6hHXTHj/L0x5OcSD1xJ29opKaGjJKEx0+buhzvFs2F7+2vfPJqVQc+h2wqhsQCAsbPRCHunSGeC0G0fBMOgXMevIwp0+iUBy5eD0DONqqAYmhKTWFI1jgCJwyMWtJASweDZVwjcScTlsp2NdtYRY9jlFsR0Y/6512oIIr4UA9y1fRpvPaoEiovv/YB04BaXxUXJIajWju+jh4/lHTGJHlmGcKFcq73Ixdsx2nctfR5QC1/Gs82Y2a0pmmspaa2xjLXZ4vDaTJG/WR5D8A7r7pQGygNTh4EvFykkDpUTjHDnCtvYhTZQXobTSbIWCAXysQVRWYr4F2wpCenwSRtTeVVZzR1VcMD2IVSenirLImxYUYpovayoV1W/+UvH8RCkXd7FjCJp5QoAEzdpx3qlBUlR/HItue5U8V2lnTqVYAY4YPXoeKW1XUEWZZfS9fvtZmYjpWB7ts4TedWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3417.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(478600001)(38100700001)(7696005)(6916009)(186003)(26005)(8676002)(52536014)(4744005)(316002)(6506007)(786003)(5660300002)(8936002)(71200400001)(66446008)(76116006)(66946007)(9686003)(33656002)(55016002)(83380400001)(86362001)(66556008)(2906002)(66476007)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?4AW1g8pSocCGrsjcu97sWZ9Cu3j4W+s3l913OBs5z23+ew+DEtcQs10KSl?=
 =?iso-8859-1?Q?C0hYK7ECsfYtOI76JOaH3NXPvmSj2+pD9q4tjPlPCc2rPUcbWNMqjUEp5k?=
 =?iso-8859-1?Q?2hnsKN2B4jWsBqgm/ujERFuDxf5fH2Kc5XZ0SErQbDBKyc7n01gLdMSViG?=
 =?iso-8859-1?Q?yv80hvsDe4Ix2EB+p9iE4YhOOHzHtYZfGb3UDvL/6qR855ieP8+9/rUsDD?=
 =?iso-8859-1?Q?rHfYBwLfUD3Mc1MnMyJd6YMwk1xpy7iqBWq3b3KlHyln45pDHtKC0RBIJe?=
 =?iso-8859-1?Q?qi6qlJvhVwIDeLq9H4S4ITtsf0w4qJXrPytfQvOr2gLc5PVIjbnGJw09Ra?=
 =?iso-8859-1?Q?mUKUHjhZwbjWRj8ymAG+LSaWGtGZbO/AW0VvLkanTAgVvMSU3hYLiQzYMK?=
 =?iso-8859-1?Q?uV4ogoJM6atg15imckm6Ck++dkrtM94Itw+B+j7A6lgnte83W7HJ0HcvED?=
 =?iso-8859-1?Q?qfHU2O08D0Di+ObBO8wr2i11HCsEnz9+djYePfXZmsv4NMcThCw3bEkbXp?=
 =?iso-8859-1?Q?gH+q8gJEmQ8DcbgcEoXYQ8u598XGIDrLB5++vziUxw87RIq1cdufOGo/Ol?=
 =?iso-8859-1?Q?6cMOYTyAB9jRa8suBZuf3rRs7npa+yBiPoY/Ju4lTIQZXQXe64iDJAdiOS?=
 =?iso-8859-1?Q?8et4oZRnwDwKOOza3RRdkMNdrvtLAFk/gUQ/FncNmcvQlfs1gUHbOvRrr5?=
 =?iso-8859-1?Q?93QoVfW0NL0SGzWlpoVYNidiDJFEo6QJgWSi4Pzk9+k0kC+qMxwzyPHh7L?=
 =?iso-8859-1?Q?KRC8U+QF2sZ4tVVR5xrb9Zo8spiACezSDYke+ulDdYeNqODcKq6ICXO1N2?=
 =?iso-8859-1?Q?sDnempykRjyHT4PF2gZcvbU+2jlcp9ZanV6lcXT9bU3c/3r72kZWrWIota?=
 =?iso-8859-1?Q?wV6QfOPDwri4iymGONjib2VaGPBZZyqDsyG01FcGiB1zwxv0bZlsoAagqn?=
 =?iso-8859-1?Q?GyG7HoSPYS9FWlhQWROCUCO1K/m3MF4P17mSLcvqUQYl5wM0xecEIc+dw5?=
 =?iso-8859-1?Q?w354iiU9nWO0AlK4WgrjBlk4fkotnnYAMGy2uWS7Sc8JH9t5jOLN3fEDNH?=
 =?iso-8859-1?Q?+bR4VMpZPb/je6ihp4aAzwBvc3upd5QWsOkJ6qIyuOfzUUJMeBLUErfMCw?=
 =?iso-8859-1?Q?oVwAIwnlZIDdDAasb1UV7d8ciEvXnO76RNpZpNgTZmFbtaLKxleODXPc7I?=
 =?iso-8859-1?Q?3uTlKCEDT8TFFKE/xQne1rOEJIQk50sWheBAcqVuSNCo0P5ez8jlJWeEcj?=
 =?iso-8859-1?Q?fGcj6h4431n5EGbvJMKvOrwzNofWWlqVC9UYCdGEmkpDrcx8yqvvyIKfBy?=
 =?iso-8859-1?Q?NM9YtetcokKK5ahz6TY2kiZy3ElNxAECZKij5RoKslq6EPg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3417.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d7a043-dd78-4868-b5e6-08d8efaf4b8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 16:59:03.8029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89501L+jFy9oP6hoTWrX8owSEaHf2AlKBL0ucxfpjvfv83TRO+DaGPpVgzpM+7W/2dKc39PX+gax1pLwrT/gRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB0923
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_05:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103250122
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250122
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

Hi All,

I see the sdbusplus library repo itself is Apache Licensed. Am wondering if=
 the auto generated code from sdbus++ is also Apache ? =A0Did not find any =
special wording on the generated code in the license file in the repository=
.
Is it safe to mix the generated code with closed (proprietary) sources ?

Please advise.

Thanks in advance,

--Prashanth
