Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA8B69B7B5
	for <lists+openbmc@lfdr.de>; Sat, 18 Feb 2023 03:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJXS90D6sz3cJK
	for <lists+openbmc@lfdr.de>; Sat, 18 Feb 2023 13:19:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=XNRKtlao;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=7412595fa0=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=XNRKtlao;
	dkim-atps=neutral
X-Greylist: delayed 22616 seconds by postgrey-1.36 at boromir; Sat, 18 Feb 2023 13:18:46 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJXRV1QTcz3c2L
	for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2023 13:18:44 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HJFIWB031251;
	Fri, 17 Feb 2023 20:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=aol1h3+WWLfSoGCn9PE4FgZ7bGVT0MWB4sEFysNLp0E=;
 b=XNRKtlaobIunJmuxWZAbEFMQ2XgrTwvYOTj0oWU8kWE2IpPDpythd0U8lgCZ00NLpWS3
 z+ylaE1f1H5csoAuhEtXU/xglwKgkarj1A84UDSuKrRDRBXceXrDfatCh/bBbRXYtAXt
 xzc6VrMNWrkrVazfp9BElNoCToKlA220C5hwF0HZ6oDicaph2b9injbKOP5usi9Vi7ZO
 UOiCeHmW0fpsRD2MUnlwMBkZp5t0wcAGJgAcn6i+AZQ5qkeEXAojrW5dBl7gldK4a0Mu
 ogaI/RTtWArRuYaqvTKH0Y+3PLSaokqT1h8IlJVpcfbvodZq4joiIvwMp/3frKCemR96 jQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3nt89chfe0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 20:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9loAZpfr3iOd27pFloSwioIHmuqS5rcgi4PCsVEkpTAziYih75IVjrg0Jv4lmJzjzqAopqUu3SD5IVJDEGqKZ+IRg1hzVUM6qiuqme3R7dRig75EEBoNapRbak4LELpHjTMab5Y7VtMh86jSo1i/78K796+HedxtbwIDe5oyEu6rL8mHdPEqMH8wBeE2E7UQaKG7T5fhclnnaIMTjjNzXvLLsnq7nX41sQDB5PWZcln9BvwWHmzCEh+yf1pGSL6A6xu6Ecp7I9rqKSMpfvuVMPyv/HS/GJDJNkM9lyXoT4/x71vk0OlPEZwoyLvgpS4JK2wiM7w9XjXloR9Dz2koA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aol1h3+WWLfSoGCn9PE4FgZ7bGVT0MWB4sEFysNLp0E=;
 b=nvc9XmZajQIoNW7a/skaE9cyBGvJTFpS+Z4IEvex0qNaL7ERzQVtjLQw5fkSMpHUIRoxElI9M+PinTMc452SkwRAqVipSl8qDXDzwVJXfGeSldlI+F9vRTF/YTazJk3kD+1b7Sj2rSgH40+F7s5urbjw411xj5//QspwnntKTmpr7F19ecOOCjOV/fVtfGjSo17ITWZ0pExq4uCRCgjzsvUDTXpUd7gxybErD8Z4c3mlUqfC5gyMCBULjJHid/cjMPSm9pXWpeGT9yJILfp4Ys+BzRam8TJz1fdGI1YeKPg2/0MpMnLnlc8Xv5KjJb3+tFFRN1gXr6KIQxtIcCyrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BN8PR04MB6004.namprd04.prod.outlook.com (2603:10b6:408:56::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Feb
 2023 20:01:42 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8410:4100:4dcf:7310]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8410:4100:4dcf:7310%4]) with mapi id 15.20.6111.015; Fri, 17 Feb 2023
 20:01:42 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Ranbir Singh <saini.ranbirs@outlook.com>
Subject: Re: What are the login details for AST2600-EVB core-image-minimal ?
Thread-Topic: What are the login details for AST2600-EVB core-image-minimal ?
Thread-Index: AQHZQfj2d8EWFfzVRkmP4AHk1M16lq7TkVuA
Date: Fri, 17 Feb 2023 20:01:41 +0000
Message-ID: <20230217200141.GW18848@packtop>
References:  <MA0PR01MB6812A470837194C53182B5ACF9A09@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To:  <MA0PR01MB6812A470837194C53182B5ACF9A09@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|BN8PR04MB6004:EE_
x-ms-office365-filtering-correlation-id: 3a9f8b52-001b-4ba5-a9b2-08db1121c9c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ov+qgUDAP7MX/MCfVcUofeGyZ0pNr9rdRiD1pl1ie2PGy5abWj+37siewHbqWDEMnNCU2Q/lgdikRDKQ1J10n27eFGa/fZv0EBEabHRJoqQZyjnnx8BzisZVqMr/tIl4UmOBqtmAKliBucVHtk/TPNveneyD7pB3mvEGFcu02yzYdKOzZFUpaK4ucC8DjmBHKuJQNq12I/tRf6zChUwK8FOWba5yM2uUzQ5lJbNBFKXXa5Coz0WkpkwGaBRilnmRewCA33h7utnfB8QXjuFJZpAeNiK12kF2YvB14U2ydkdUXaH198N40ZVUuxnld9lank1cSPWxKvclaqtMGEO+HZJUpuhvqkn1eRnYcsFaXedBllptxRfdcQf34dN7wB85OyhRk0OlLGip8ejzgTnAJRkTDCTwPFrfVGfdDffxNGu17kt5Z9r9SrqhHel6ZaThRVY8AU2SbGXjm/Fmon3PEDB5GwUC/wZUg0wXLH/0+roqCOnheBkcwn+BRJChADjHGx5rtwUQnRwuwDFgjMSRv1Oj39yOAZGBIg9lbeaMkTEu6ukvECiDvSOnEyK0xQZNhnZyBha5ec5Sj6i7DOrWPBbFC69y2oWlmVHzx9aXtbFOhoAkYWxn+rT3IM1s4TUF+i/YeXXb3/vS3pgzIwQkkl7YLRLqxvNld6tvy/L6HAZ/lCG2GpRCDFGyhHtUuVhBlo7rOOrBELLhWIiNgB4xdw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(38070700005)(33716001)(86362001)(33656002)(76116006)(64756008)(66946007)(66556008)(91956017)(316002)(66446008)(6506007)(66476007)(1076003)(83380400001)(186003)(9686003)(5660300002)(26005)(6512007)(71200400001)(6486002)(478600001)(122000001)(2906002)(38100700002)(6916009)(41300700001)(8676002)(8936002)(4744005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SlF3dDZQQWl2OU5qQVhFS0l1Ym9FSXptR0hFY0NXeGVHd1V6bTVUOUpNQ2pX?=
 =?utf-8?B?SGh6ZCsxbzdFc3lDc1Y4ZHVQL2syYytjVlQ0anZOQ2VYUHNQZWhpSTY4L1RN?=
 =?utf-8?B?WUQvQVRodVpEdEovazdrYWtpT2FVeU1GVU0vM2tzUDhJQms5bkxmRUdyTSt0?=
 =?utf-8?B?VGwvZDZ6R3lSa3J5TmRtc0UrOWhuR1dacWVQelBWOHF6akx5dk9WYS8zNk9x?=
 =?utf-8?B?TUtIVC9NUC8xbUdYcS9pbUlGZUczbjhtTkpLTkU2dTU5NGpxOVpNck5Qb0hi?=
 =?utf-8?B?M0NQdHRhc1BLK2NhelZYeUNIMjlwVDdnK3dBNy9NbjFXQjFrVVQ4TkEwdytB?=
 =?utf-8?B?djdDRHJqTHZoalZsT053cHo5S2w4V2xBazcxT29HUjJ2RzR4MnN2Yjl2MjFC?=
 =?utf-8?B?MllyUjFKcDVTdXBHRDNEMkdhS1JCaEFQQ3NkQnRsdHlSNnVzK0ZRT21pMnVP?=
 =?utf-8?B?U2pyR2lhY2JNQUhEd1NEaGFGUDRNT01JM1djelNEZ3RLeERxajZPbW54aVda?=
 =?utf-8?B?ck4wOU1GWmF0N1hFMlM4d1ZBeGtndHlEdWJxQm0vdzAvUmR6SlRVdjkyUmdn?=
 =?utf-8?B?TkNob1VDMVcvcDYwaTd3UjZhNFVYbkJGTUdxK0pIbUsybGhhQnFtUDZqSmVM?=
 =?utf-8?B?d2pzVjRHaEREVW9qNURLV3Vyc0Y1dXplTGs2OGRKbVFLYURJbzgxbHl6bDFn?=
 =?utf-8?B?WmNEcG1zaTJpV09Pb080NGFmYmlubktreW8vOXRSTyt2dzlrZm54eFIvK3J1?=
 =?utf-8?B?M280OHpJWkM3bjJaeFBndVl4RDRwLzc5TFZSa3hFQjBFaE1YVEdISXlSbVgy?=
 =?utf-8?B?QWxFbVEwQWFWODhQNXFVV0RjaVMrMmxSdFBOTk11RTV3UDN5SGRvNmYxbDZw?=
 =?utf-8?B?QWFWZ215cDU2VDJvbTBjdTdkYm9LaDNzTGZKMGZBVysvTEtDSHlENkJFTHdI?=
 =?utf-8?B?Y29LNmJoQjRLWm1OaVJ0TlFJaDVFdVY0eUo3TzNKbDVnS05CVFNyU0JYdGlC?=
 =?utf-8?B?U1FHRFY2V1VRL04vRXdZVFVscnh6TlVJZkY5Nm1QaWdHVmxMaHFWQTQyUk5M?=
 =?utf-8?B?TzhpN0FFR1pyTUFvajhTSVE5UEZ2QWh2TlBKUnhnTDYybE01VlR4U29FaS9q?=
 =?utf-8?B?dThpa29NcXlUQjBSdEQ3M3NDZHh6Q1JsNmJ6NTQyWWlrZ3lwc3NxYTQyaWxF?=
 =?utf-8?B?dlQ2aFRMeUk4dXV2ZGd6NnNzZTlEUkJwNFkzZVVGYnMzY3cyRWRZb1pRODVa?=
 =?utf-8?B?RzlFSnhyWWpXNGlyRXF0WThwQ1ZvaFJhcHJ0bmwxeUNRekY5UkRmbHhyOGFz?=
 =?utf-8?B?eHZzbkkrbm9nS1hFeEgvZk1WaHc0SzhxbnlJU0s3QnY0OXY0NzZxbnBxVFk3?=
 =?utf-8?B?TXZOU0ZNaThCa2hWSEFwd2J5WXp1QVZBKzlMZXphRXllcVNmWmg1bW5sampP?=
 =?utf-8?B?RVpsbEhDcUhRK2xQckt5T1VnUnpDR0t2Q2xiaFJCQ1FsYUhNdGp0eTNZdFh0?=
 =?utf-8?B?MXJhYzg4dFZOZmNpTGtYeGl2L3ArRkUzYjR6SDlYOUpvSjFTTE5KMEdMaGps?=
 =?utf-8?B?Uk4vbmN5aEJXVU0rbmRzeGNVNUg5VEdhc1g0a2t5VW05anJDeWgzd1dZOHRP?=
 =?utf-8?B?UUNzTllXcjdlNGpLRHRpVk9BZll1bUc0dllMV2p3cmkwMUphb3N4a1duZUhi?=
 =?utf-8?B?aGtOdjlhcEpTOG1QWjkvcGhxWWNYZ0NnRWs1S0p4eDRQMm52dnRYcnZIazdz?=
 =?utf-8?B?RVk4ZlJsWEprdUlhUCtrTEx1YUlBMVJ0QWxyREl6S3pxUi80VEhnVHA2MS82?=
 =?utf-8?B?L0ZlZzdoYTUzdDZ1TTZheFo0Z0YwN3VLeEo2NVlKdE1aN1R3L1dQSnNWNWJL?=
 =?utf-8?B?TnB4TjlDUHlXNVBraWZIVE5pbmR0blhuVVZzWjgyVGhPNUxrdXFUVzh6UXo4?=
 =?utf-8?B?QzkwU0o4U0kxcFh4K3QrRmdkQ0VJZDNpbWl0WFRsekdFSW1ja1NMT2JDbjRB?=
 =?utf-8?B?VDlBRmV5dTZQSnRTcDdFYWl2c1NVNU5XcjRieVdmMkFLQjhoMWxEM2RQKzM4?=
 =?utf-8?B?c0h0M1llVkMvSjNYT1p5UkVwK2FVN05wMHcrUGRxY3VXZnFMOHlOZW1sdGJo?=
 =?utf-8?Q?ZU8U52fFkDf+02hv2oFntvkND?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D885D86FCF30249B6E88162B8C8B764@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	X/3ee7U6p2TrhWIPcU4G71ytvf6FdgboycIMLTicBRLlzFRgsjaQM0RkHMopRYnUn7Gc9Q3OddZ4R7npk37DKapvLYHE89zBImwizfW1GUoeVhoAes1ylLxYQ10C+BYlvBqE3ulZx641Jnhjj++Dh8Q0RvD6zqauYYixDJrxwxZDQOipIlXVJljgoDOEQksoYeFo73aZKLXhaUdKtdUAcw4pATFP5F55HL3E8H/5wpys6MV/uQzi8rJ8iTpnPC4O9eUsVimNrjpmGNn1ZBr/YM6B72EPacbzpAlMQ/UIFJd6+tk422AXO7OHCcDgm2oT8kvBBb473ISJ3OoG3d9ss0NI2elV1WuKOFdeBm4mtrxvb4Tw/8+V1fz+vE50BXRKTgw1xTFOq35LkghxFlMp6/GJcld+xPUo/T/1XGBG5Qr0349rBCOGvHdpKnq4SHXkGIH/5HVc5dPjOpEZiZOWp7q2wqMBPa9qhe7hFC+e04NHibD/aFiJoQHkwZAiCTq41m5PAARNqyxhm6VO7VDgDT5NBub4GE/hseZquHcq99DsQQGDmvwuKeaWDdvTFGm2SycFjOq15A1CTUKfoboBKMIJiUA4EuVWjIBcw7F5s2Xf9D4G373PpzeHV+S5mFuB6tsRMk0v0X9LlP5EmY6igOP/LOlaNRoI6OVsS2JTcXGKVyWSTJ4V9xGDF48E9dYpI1tvw04DE6EQYoi+N7WVEiv3/yjFIxq8pj7YKxklcA7ilRMK0SBP1Zp76GnQmPQHSBwcEdFgDsm0ofhkfWgSYQfo4nf8/hQ7KVcuSx15PnO7Lq4NvEFVMZ8oP0eD+X4vEuDXma+cx+vWjtROjGkasTZawW0jLpi2M5LCRgHa3EY=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9f8b52-001b-4ba5-a9b2-08db1121c9c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 20:01:41.9471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+5N7KQY7iGKGl6r59EGMNeqYNuUNUb7P78g/9/giFz57N41HWVvI6jo1181O0wk+w3pOOVXSxno7rTmQ1czDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6004
X-Proofpoint-GUID: Ftsy_FaJghyMft475gid_XTlR4m6ifTD
X-Proofpoint-ORIG-GUID: Ftsy_FaJghyMft475gid_XTlR4m6ifTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_14,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170175
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCBGZWIgMTcsIDIwMjMgYXQgMDM6NDk6MzZBTSBQU1QsIFJhbmJpciBTaW5naCB3cm90
ZToNCj5TdGVwcyBmb2xsb3dlZA0KPj09PT09PT09PT09DQo+DQo+ICAxLiAgLiBzZXR1cCBldmIt
YXN0MjYwMA0KPiAgMi4gIGJpdGJha2UgY29yZS1pbWFnZS1taW5pbWFsDQoNCklzIHRoZXJlIGEg
cGFydGljdWxhciByZWFzb24geW91IHdlbnQgZm9yIGNvcmUtaW1hZ2UtbWluaW1hbCBoZXJlPyAg
VGhlDQp1c3VhbCBPcGVuQk1DIGJ1aWxkIHRhcmdldCBpcyBvYm1jLXBob3NwaG9yLWltYWdlOyBJ
IHN1c3BlY3Qgc3dpdGNoaW5nDQp0byB0aGF0IHdpbGwgc29sdmUgeW91ciBwcm9ibGVtLg0KDQo+
ICAzLiAgcWVtdS1zeXN0ZW0tYXJtIC1tIDUxMiAtTSBhc3QyNjAwLWV2YiAtbm9ncmFwaGljICAg
ICAtZHJpdmUgZmlsZT10bXAvZGVwbG95L2ltYWdlcy9ldmItYXN0MjYwMC9jb3JlLWltYWdlLW1p
bmltYWwtZXZiLWFzdDI2MDAuc3RhdGljLm10ZCxmb3JtYXQ9cmF3LGlmPW10ZCAgICAgLW5ldCBu
aWMgICAgIC1uZXQgdXNlcixob3N0ZndkPToxMjcuMC4wLjE6MjIyMi06MjIsaG9zdGZ3ZD06MTI3
LjAuMC4xOjI0NDMtOjQ0Myxob3N0ZndkPXVkcDoxMjcuMC4wLjE6MjYyMy06NjIzLGhvc3RuYW1l
PXFlbQ0KPg0KPlRoZSBpbWFnZSBib290cyB1cCwgYnV0IGRlZmF1bHQgbG9naW4gcm9vdC8wcGVu
Qm1jIGRvZXNuJ3Qgd29yayAuLi4NCj4NCj5bY2lkOjY5ODkzZWU4LTA4ZjItNDcwMi05YzBiLTI0
MWViYWMyNWVlYV0NCj4NCj5UeXBvIGhhcyBiZWVuIGNoZWNrZWQgbXVsdGlwbGUgdGltZXMg8J+Z
gg0KDQo=
