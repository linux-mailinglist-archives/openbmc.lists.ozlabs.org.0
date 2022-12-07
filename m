Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5239645440
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 07:48:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRntt4C8rz3bZQ
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 17:48:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ZaVufpYT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=53405e80a6=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ZaVufpYT;
	dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRntD5qYPz2xml
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 17:48:19 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B74OiOX006170;
	Wed, 7 Dec 2022 06:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=WNTUXSdaZXTzNXYCGAbqjx0pOPWikfUDQNXYaFBuTNM=;
 b=ZaVufpYT/Ozr1rgjCu7Fd6YjLlZ+G8sEwftGVYWD2Y063ej9MOpu0Lo1zgyCZvJsFHeB
 kXwCjkD/D/fZun/7JP2WWmDL4DIf11ZuwfPJvnT/B3kr0BLevQP0CcHhfo/tdYI9yKd4
 V2dTw8W9I8/kDdUmuNMGPaEaJBZjJZUg3v4bpvtAOsQSRJKROuqfG5SAsRK/f7P2Ix+M
 AgojjiqBvNfgSvnxoabZk04DvaLWJ67vOiOiI3oZPrxPce3v7mZ7vi7pUnwGfSmMjiVp
 5idzeoJyZyYqfR2u8Z4Pe8Dm40klJ/CeQjrPrhYZEMbTG24AcG94gYwKtL4DdgO4qWpt Ug== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3maks38a3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 06:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBeYzHboxyKqXszr544dkzNJvhl7XJWBVb1sLGXAJDIy5XQW2sA7s6lq7WFlluhT4OgARcH3heHbOP7+MR6nd//LRPJtv/OlULqsZyBQ7WnkVyS/Dkbq3JfU07k4T5ZDaxM1lqhVNzc+aecqeX2H4PmxDBHsmAhidXYoo8u4mf6KdXRlevMel6ApViNWzapIbzUo3Qa3Bu6JUTkp+9Erjy7HX+yEYQTbfpfK83fN3948HMHedsdfoo9QO2iFZUulU/6n6OrsWgbO1mlTNZ5yGDJVKycVxXM98nS3MAKJx6ZK6pyVQkjLGOO7N24umeKCDvlVgVtS6N8uFEwdXcRXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNTUXSdaZXTzNXYCGAbqjx0pOPWikfUDQNXYaFBuTNM=;
 b=ZS3J2Ei+p+5Do9lal3vDa9dsx4+a0tnNiARxBpJkzHdgFDl6FIqd8sKwuWxTrkylhCI2POcfvH+OqAFz9P407iainocTenBfExqiz5sk0Z3Kcg2SygA7l+sIYbuneuzVcOO8Wr/t7PNPztWVCE2paVc4TEdEoBuisfmNLg69iADmgg8JmFMDQmSr0m+KxUSlxX7IJduTeXAinjhy86ltTakBLyQ/JeEbyEMXHmBF/AmewPzcIotj7cFUMN2EoB2WwEMBChxYAOKzsug1VEgrv1isms3AjOSty8XOfUdCLxF8j1TdSEIFtSx3mB/+whaf5Cu3J/t4QGhHP/mzstgnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by CO6PR04MB7507.namprd04.prod.outlook.com (2603:10b6:303:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:48:06 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::b61a:cd67:2399:b726]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::b61a:cd67:2399:b726%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 06:48:06 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Ampere's Mt. Mitchell BMC
Thread-Index: AQHZCgfcAJEI6Ol9xU61TemEjmn4jQ==
Date: Wed, 7 Dec 2022 06:48:06 +0000
Message-ID: <20221207064803.GI18848@packtop>
References: <20221107071348.3996144-1-quan@os.amperecomputing.com>
In-Reply-To: <20221107071348.3996144-1-quan@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR04MB8002:EE_|CO6PR04MB7507:EE_
x-ms-office365-filtering-correlation-id: 9be2fb7b-cac4-4966-379c-08dad81efef0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wX7uKgrKgtEiVDl6HQwsXVvIKVDip17ASKaUUkPwv3nN83KjnBlEW/8NVHQckl/eEjp/eY2HZZRWnReURVd99jYmON4uhOcqZA007cVrgfIFuF+h1K/TbJYeyDKoZ71jLriJQNQINO+4S04hM9WKZThG1aNquZX87HmXxC0JnI5a7OmUaw2tc6qSAeK/mtgkmrN+F7sVmi80MxxLeyY2sccQJwRU23ysL72KGQNwjX8WCZSqbU36TLbLJLiC72LqFmfFcY8D/jPgY/SIMDqaynmX2KqkldaRIEZIrxMq71SKkCIDuvY0qAZzpm9z5nrBYIzmtaWzLkpYCaG3Sk8d0YbEnZt9gGQFZyZ1z+Vzsyp2Te8GtPVnHK5p50h16aOlZIKhjHjkXduK6aaelpXj+kVTI15XSY/VR5WKjeuJzRswbVOskwDzecr4kqXvHU5lCdcbmB8QELCaAtnZp30JWHjJTe5b6Sl22zUPPKkKklds3EsinMW2wU2OXF5ZfMnkpRijDkvDlBzMzootysvxbTDd4lS+np3mi2VJrrX7R0xsVP9TVfn8/m2tPcWsxbrOo7wW733NVx6X4xCghE2IBw2zdRSrcI0tQ57vlMV9IBqonM65/8FcXLIAB9FnL90TYoeM7eCh0FjySRdiu4TW9//AQ3H5mflB3Pv7tP1NAoQfvvh7P0LVL3+e37DTvqTA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR04MB8002.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(33656002)(122000001)(83380400001)(4326008)(2906002)(86362001)(38070700005)(8936002)(66476007)(8676002)(66446008)(76116006)(66556008)(91956017)(64756008)(66946007)(6512007)(33716001)(41300700001)(5660300002)(6506007)(26005)(71200400001)(9686003)(186003)(316002)(6916009)(478600001)(1076003)(6486002)(54906003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?kxpWuy9Zplj0CP9M4flsLRNKu1SLIkCGVEPL+Xc+sRPpH35JTZfiA1yF2GHY?=
 =?us-ascii?Q?VqpYgvr6pUWxv7w7lhGHG3SgBW8yRO5j2o2xkqBLH5lV4jQK56Ju/BRR0ccZ?=
 =?us-ascii?Q?Yuz4qdTtLVJ9r5/PUYjvdJ1TKir6+dXGel7wRL0bTGwz9TAzMdmB9a6O4pae?=
 =?us-ascii?Q?Z53TpSviircMrFeJEWUh4br7f/ArjVn6/2b6OEwc8UUL2zjP0+vLJBEMLyeK?=
 =?us-ascii?Q?8J4sUtVJOVpy5HGXwdfEFfKcs5o0Twyl0sKabBvsPPmgjE+BkzmGmtb7RcWj?=
 =?us-ascii?Q?7TRSn23bgf0/kyL4WfENUgAVvL7GQ1Gz/j+YZaFd3ZQIMKtvzCdEcMUpLLNn?=
 =?us-ascii?Q?FJs2VRtmMDj299Lhjv9f/Zsl+y1lRTboDCrh9I/d/fcZDl5C0btGK2Vt1wpG?=
 =?us-ascii?Q?csVUOF5a7ZCjRvoDggjWGAiEGVtXlZd1lifZ4jyq6rEQ1Jher8AoGGm85Tft?=
 =?us-ascii?Q?lLT7z9hxIvC2Pn0T5Ga6NubNvFiPASvQI5oOtr9qbtiaPH/yinb79DKWWlIq?=
 =?us-ascii?Q?gYmSU2R2NjWnQzUi3vknn1sJvu20zDEy2hXp7ShrEa9Y+UUipwfGem5kZqen?=
 =?us-ascii?Q?fxyOTO9/qH7eCjVeHKlbImdELuclNbOnHb1HBRFf2QtKNmm09NpuRlm6AKTr?=
 =?us-ascii?Q?GW8ihwjDJulnwCuh25hGHFMxRS7evvYMtqBmQQLCjMX0GTbmHDgWESv761so?=
 =?us-ascii?Q?21bnIn6KsrKqNZIzcJuXRIOms7SIr7e9M7hyU1JmDg2nqw3S6PS0qRBaMAdZ?=
 =?us-ascii?Q?wmUii/6DPQH8YcAxBaDEQCbyskvXTWHTYdO7+kK0fJPtWZGJNbHhwlLmI9QF?=
 =?us-ascii?Q?keTYxIWJC3ob3iEEzjnBA/T814xVCKX0Fp4tiGhHs4zFyUMC/2RvZ/qAdxU6?=
 =?us-ascii?Q?GJNDtN+Ssc2hV9ayqwC6Fxp1IkkfwxroFIBjq4Ikmy0Q/qQS5byH7LGMBx2Q?=
 =?us-ascii?Q?6u9DiVDLsZJgZzmSWmNh1NXSFkYdvaOlVBO917aXLMNKV0qNeaU23hmUdZWq?=
 =?us-ascii?Q?TvK7u+G2TMGTUa6C9T6x49NRVLhPTBXr6JmUiKU3s1Z2DvribM+/OQGQxFS2?=
 =?us-ascii?Q?rwxE8i1g5H8QUzqpQgYGXT6PRqexqUSxfDZjMCvaySuhfbS+4WjtAYSS/1zu?=
 =?us-ascii?Q?Bd5tl869AA69f28jk6lehbc7Ko9qG+O4Y96EWdcbzliWS+kK67RtJPMTZBoo?=
 =?us-ascii?Q?AmgzinXjSBFUe80NLYWr9chX4/h+8wKX438jw85V5dsjnBpeSJvOLuxYlhCb?=
 =?us-ascii?Q?v6/cMFgr8fxp0kRl4nVA9lsEhpHm91COFEOukXWhSaKVT3lMSJ6m2GY0P0QN?=
 =?us-ascii?Q?TT6w2UVbdsM/H/t5uIZEudx/Y3HhjnVHHLf5XLs1JN7ppPMTnAwShYwpTBG8?=
 =?us-ascii?Q?8vghtTmogtlalPx1Y7QC2w/DxJEhoUKsZTCA7T/v3JvmvzaziTvVuq6bEs1J?=
 =?us-ascii?Q?hmaFYBoj4WIFJs6sKHRfhj9gR6LYRQxrLJI6QKAd+V/2ayRhXFEwPI7A7I1v?=
 =?us-ascii?Q?8JDsgZM/p8FV7HvtPmx4g71X4meWHkHPUDhSxMd51vYSCGE856z7lA7c9ssp?=
 =?us-ascii?Q?3VwmpzpXBE8+qKxKG7XPN1OnMdOdEa9gPFaICe5w?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF253C79DEC53545A6A89D23D891252E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?jFCX+s3ixDoJBXUPcPMsLkN2b0NIVhd1d1SdNvePq3eLZNi4v9h4Inv5U75Z?=
 =?us-ascii?Q?SywthNjX6oyuAcoOhaeKRoP79l7GjMJtum16/AMv2ghpDEF0miigs6JQRy+t?=
 =?us-ascii?Q?iDtf4SLF3SMuwoYyZznoZpbTaMlXb/3qw8DJKC6hFJb/vzu9VD2vLj0eoeSg?=
 =?us-ascii?Q?/GSh7VbXuL1AbOfMo8nEQLuUldadcbjAHGYUe7T9wvyl1G4PPLXGAxUIMd1V?=
 =?us-ascii?Q?ywmWlKz9AeadvymyYDzZNkl8aIQ7PJu2Y2fTkCywqWmqP77iwzXtWLmCJlyK?=
 =?us-ascii?Q?KEVYX3IhJ+xsqOIMoBiEomPT8VX431VrPUtJKQSvZ80nHQmnEkUXa+mbPIme?=
 =?us-ascii?Q?UWagwZOmOcsd8PCRiSuMy8kKFhYfRBJH9nvFM5K61ip74dUzGWYTuzYCLDfM?=
 =?us-ascii?Q?1yR0V+uFB/74Sjs6GHBwBhdLfzjscqlQTheVWpqzbxE5VxmIK/xg/1Qc9/VL?=
 =?us-ascii?Q?Q+F1lC96YTswb3M/msW3/yf9vTyD9k4Rv7+WcQSnGJfu7155GLpp8vSYmdyX?=
 =?us-ascii?Q?eZqayxvv9tEAJ3wx6LApwRIgr/jmXNUQrHwBwhbwm5ScxfSySHMY0hBXJxD0?=
 =?us-ascii?Q?1MYiu7JTv8ekfGTzgwAUv7ZKd0wint2KyY7ZS7Mygi6YZKlAkVBTI3nMQyxD?=
 =?us-ascii?Q?8hIgaKM0SE2rhcr60ucbIdP0/PG9uC5QzFUXtVVpqYGx1SDjPIa32VSXM2L/?=
 =?us-ascii?Q?hxMv7n5K950kwSUCTNVsc0aayurlFxfB9ghIzbaKmX68BTh1qL0Ky+7fB3TR?=
 =?us-ascii?Q?EGIix0vi4sisb1vvR641XZ+ievA4ix3/oT2304fnBBoEAob576Bqd+jnji2b?=
 =?us-ascii?Q?Tzj0xrFWhAUVeKLvvNh6eUP2xftC2A8wzSbl3k0Vl3heigziJoJGkJV/Eg2s?=
 =?us-ascii?Q?1PKTywwlWd50+4alpEuN4TvZ5av2kqgtvyiDrcoHPUnklc8hiAhYAugR/J2S?=
 =?us-ascii?Q?yzjlluUStcWzxRU1uneoGHjbTh0VnVolk/jdeWv/WUYjkkWBef32DZNU2kpf?=
 =?us-ascii?Q?f6DNaQphj/3gtgfOKgmY72vCV2z1aX3w3KvjemZ0QaonN5Wz3LqLXjE4FRRW?=
 =?us-ascii?Q?S8U2H36IO136bGJQswwJTxy9Cj6wDw=3D=3D?=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be2fb7b-cac4-4966-379c-08dad81efef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 06:48:06.3495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kKCBzIaE/az9slIfFwGSZIsGt/RRMQ+A/jrCEg4buNPrwUkexQn+9KtS7vJ3ybaSUHrKiM5VQXgfm+KZ8FIV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7507
X-Proofpoint-GUID: gkXoGMcUt2O16KI0eTckeOXngZBlCYMy
X-Proofpoint-ORIG-GUID: gkXoGMcUt2O16KI0eTckeOXngZBlCYMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_03,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070054
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Open Source Submission <patches@amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Nov 06, 2022 at 11:13:48PM PST, Quan Nguyen wrote:
>Add initial device tree for Aspeed AST2600-based Mt. Mitchell
>BMC found on AmpereOne's reference platform.
>
>Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>---
> arch/arm/dts/Makefile               |   1 +
> arch/arm/dts/ast2600-mtmitchell.dts | 114 ++++++++++++++++++++++++++++
> 2 files changed, 115 insertions(+)
> create mode 100644 arch/arm/dts/ast2600-mtmitchell.dts
>
>diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>index 6c34b83336..b6f9df21fc 100755
>--- a/arch/arm/dts/Makefile
>+++ b/arch/arm/dts/Makefile
>@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	ast2600-dcscm.dtb \
> 	ast2600-fpga.dtb \
> 	ast2600-intel.dtb \
>+	ast2600-mtmitchell.dtb \
> 	ast2600-ncsi.dtb \
> 	ast2600-p10bmc.dtb \
> 	ast2600-pfr.dtb \
>diff --git a/arch/arm/dts/ast2600-mtmitchell.dts b/arch/arm/dts/ast2600-mt=
mitchell.dts
>new file mode 100644
>index 0000000000..69ed0c5fbc
>--- /dev/null
>+++ b/arch/arm/dts/ast2600-mtmitchell.dts
>@@ -0,0 +1,114 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+// Copyright (c) 2022, Ampere Computing LLC
>+
>+/dts-v1/;
>+
>+#include "ast2600-u-boot.dtsi"
>+
>+/ {
>+	model =3D "Ampere Mt.Mitchell BMC";
>+	compatible =3D "ampere,mtmitchell-bmc", "aspeed,ast2600";
>+
>+	memory {
>+		device_type =3D "memory";
>+		reg =3D <0x80000000 0x40000000>;
>+	};
>+
>+	chosen {
>+		stdout-path =3D &uart5;
>+	};
>+
>+	aliases {
>+		spi0 =3D &fmc;
>+		ethernet0 =3D &mac0;
>+	};
>+
>+	cpus {
>+		cpu@0 {
>+			clock-frequency =3D <800000000>;
>+		};
>+		cpu@1 {
>+			clock-frequency =3D <800000000>;
>+		};
>+	};
>+};
>+
>+&uart5 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&sdrammc {
>+	clock-frequency =3D <400000000>;
>+};
>+
>+&wdt1 {
>+	status =3D "okay";
>+};
>+
>+&wdt2 {
>+	status =3D "okay";
>+};
>+
>+&wdt3 {
>+	status =3D "okay";
>+};
>+
>+&mdio {
>+	status =3D "okay";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <	&pinctrl_mdio1_default &pinctrl_mdio2_default

Not sure if there are any particular official style rules that apply
here, but the gap between the '<' and the first item looks a bit weird
IMO.

Aside from that small nit,

Reviewed-by: Zev Weiss <zweiss@equinix.com>

>+			&pinctrl_mdio3_default &pinctrl_mdio4_default>;
>+	#address-cells =3D <1>;
>+	#size-cells =3D <0>;
>+	ethphy0: ethernet-phy@0 {
>+		reg =3D <0>;
>+	};
>+};
>+
>+&mac0 {
>+	status =3D "okay";
>+	phy-mode =3D "rgmii-rxid";
>+	phy-handle =3D <&ethphy0>;
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_rgmii1_default>;
>+};
>+
>+&fmc {
>+	status =3D "okay";
>+
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_fmcquad_default>;
>+
>+	flash@0 {
>+		compatible =3D "spi-flash", "sst,w25q256";
>+		status =3D "okay";
>+		spi-max-frequency =3D <50000000>;
>+		spi-tx-bus-width =3D <4>;
>+		spi-rx-bus-width =3D <4>;
>+	};
>+
>+	flash@1 {
>+		compatible =3D "spi-flash", "sst,w25q256";
>+		status =3D "okay";
>+		spi-max-frequency =3D <50000000>;
>+		spi-tx-bus-width =3D <4>;
>+		spi-rx-bus-width =3D <4>;
>+	};
>+};
>+
>+&scu {
>+	mac0-clk-delay =3D <0x10 0x0a
>+			  0x10 0x10
>+			  0x10 0x10>;
>+};
>+
>+&hace {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&acry {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>--=20
>2.35.1
>=
