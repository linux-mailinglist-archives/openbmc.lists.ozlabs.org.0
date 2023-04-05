Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51926D8C90
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 03:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsNlN5C5Yz3cLx
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 11:12:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=h7QQddMO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=prvs=045982f9d2=verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=h7QQddMO;
	dkim-atps=neutral
X-Greylist: delayed 4372 seconds by postgrey-1.36 at boromir; Thu, 06 Apr 2023 10:53:07 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsNJz6Hfyz3cBk
	for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2023 10:53:05 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335L5GQ1014327;
	Wed, 5 Apr 2023 23:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=kSQfgYRX85LGUpRRjrNONwSUkjxKpooxqW1Q0QTl7V8=;
 b=h7QQddMOz2349yyRoabp/YUtomsGJF7Q37TJSy0U8BZqLLAyHYBz4NIiBUHPvNU9hfQa
 cg1lhs99wvubfIgamU1+1uqQS8AvAj/ROapFd79n393UI442yTuFQgDyRLz/MCt3s2Ev
 4vhvpKPyA0rNdcL67giOOL/47vMIze68qmZaCXlkd/7oiWakT0eobk3/PXsuKPpKhCao
 P1blXemxGPaG4eAiHpsLhxsnCiqqxcnk0L3+3U7owIfwYKsn+nMBOVL4otEtnmzTDIt/
 ZRtm5A42HqzZCDg6IMIlGIKHTZiaxHn08lyheHeRjJ3t1R8JTb+3JOtVSxUt6rT2C+CT 2g== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3psgk990pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 23:40:04 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 7CDBB800205;
	Wed,  5 Apr 2023 23:40:04 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 11:39:52 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Wed, 5 Apr 2023 11:39:52 -1200
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 23:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc6NZ9CKLxATt/lCg8Ca8sU8Aj9WXWZ4fzfuOv37CiBr4iJDDhSq3XDIQFAnjgSDRudYETQyDXkaN/6QILU1UNfPUsz61eLvHWH+Y59tEpBR+IKWKu/GLJeq1Edq0uAeY2r6O5Ua4v1Pb58/Db7zPbMTeioUlPoi5SHMnSW2avzCzSUrmszlyZHEdHItny6anndeSlsSQq2xizQBmS8s4LbITzyv8WKe8ytzxEk6G9U5bZJZFZhdDTckziGBdXWeFC3c7fnwJJ0q63XIwt+MEjWkERc67HSXMcCnnU1IC1EKpDC5JyuOv+bJqWYVftkekNZnB+mBM391CPbPM/iR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSQfgYRX85LGUpRRjrNONwSUkjxKpooxqW1Q0QTl7V8=;
 b=NDe4hr5jdRF5w51KYDPDdVtuKwiabHotcsNlifkHOR/9p3zLamJ6X6wN/QTGrh6z41vWL1uRPp73l/PNfDO/eZJ5GRW4zJi2kWZOUU0qat3mqE+X9jJdCzoPiii40Jf0OVGvPkSNqylVtWORU6kuRnhf0Oc1JFAWsJlQ8eun8nCVAcbOC7khDrNB/UpGV1b92K/UlmKczn9yvpyB77CTATT39Vg/iViT5FvtC+Sdnib1wwXOlhu1fYYZhvI/EDBWt/JmTWx7ztWarmYWDDwxIzTi7FLUMX5YZHP8FcsqCoxzRx8EaPy0H1JZ3hY0UQFWmJvTmIsd1RWTSs766wylmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4f::17) by
 MW5PR84MB1428.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Wed, 5 Apr 2023 23:39:49 +0000
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e]) by DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 23:39:49 +0000
From: "Verdun, Jean-Marie" <verdun@hpe.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: GXP support into OpenBMC kernel
Thread-Topic: GXP support into OpenBMC kernel
Thread-Index: AQHZaAZjdYyBKBBOcUCwAOsKu33JVq8dXgeA//++rwA=
Date: Wed, 5 Apr 2023 23:39:49 +0000
Message-ID: <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com>
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
 <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
In-Reply-To: <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1976:EE_|MW5PR84MB1428:EE_
x-ms-office365-filtering-correlation-id: 67572ea0-f2c5-46af-671a-08db362f0bff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mmy/T2EkkvudWPvgVoPbA8Xo7fzB2jSeop38hM3Ewki5W95mew5+xSY/bOkJKhvgJetYzbZHIl41YhQUuiXPmv55u2S1kpW36f3DO8XJGIMb/l5UOOAUCMQs+6eiOBeM03zcwgejepUBluXuKjnbnSvojfPKsgs/V1pg0kTqChK9DT15fmvN+vpgtlyKv5sXjNqR3w5ZkZPezI0xv+u4NcTHZDILmZ9kdeHS/ZsMRYPFuFRxdYVw63+b28wL8NjrithYZH5lZOlcrwYvc3hIVdBQs39CEsgGPQIl0L+NQh+U6mHX2Ne+R+bGD91JlS3gf71X00oObniadjYjSHdn2qBrXiSFUppWi7VrFA60Q7Yqw7Sl966GC2zetX9ReNWEEk9Oj/mqxI+BNdDAsG5a220oEYZWTQM2rpXY2cKgwQGrwkl6fyzLECARcSLr/MQ75/VvUXAUivHl8g0XaH6cfRs7PXQXIqSko9i2FsqscpG6DPv3p5uCxsXzAIUSR9+N1S7KSKLRnj9z1901PgW/qu3dSZcgJPIc3TU85kBcxAW5gql9S/vIENPgh56k/MoBOef1/WPy/9X4v5zMJnpSd8r6fcx4dcL/7JYon982ejCSfGj88txX9qcCE3ErT9o4w6y4NmQ1+nh/B4GsPG+FA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(91956017)(6506007)(71200400001)(38100700002)(6486002)(6512007)(4326008)(122000001)(41300700001)(6916009)(2616005)(66556008)(66946007)(76116006)(66476007)(64756008)(66446008)(8676002)(82960400001)(4744005)(38070700005)(478600001)(186003)(5660300002)(2906002)(36756003)(86362001)(316002)(33656002)(54906003)(8936002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGw1dmVNcGRVS2lLSjFBcHJYaGtrTVZSdG5NM3FabUJPOW82WW4zQXJ1aHNP?=
 =?utf-8?B?VnVkekZLbVhId2J6c25kNTgxNnRBaDVnSDhlVVVCbHVheGRTVjY4cC9xZDl0?=
 =?utf-8?B?ZmRzWHQxOGcvU05OTUdZMElzOS9qdjQzS3VIbkRhOGVnUWVpaUZyWUN5QStC?=
 =?utf-8?B?S0JmWWpJYkNrSm5FaEQyOS80dEI0QmFaeGk5Tk03a0x4UmtzR2tGWHA1dlBH?=
 =?utf-8?B?U3JTMHJhSmhTZXR0RHJYblhKNS9IYnZWQnBGUnRjSlJ6dzZNVWRPb21iZ09C?=
 =?utf-8?B?TVRKbExaY1BlVDUrb21iNXFtNGVjRkI5Q0d4cFpnNFl3ZnhYZjI3bnRTOG1D?=
 =?utf-8?B?V2pRVFFRalZ1ZHFjM2hraFVBVkg4WUxHTjFaVVh1djlrK2VXc0xMSmZzdVRy?=
 =?utf-8?B?Ky96NFpwUHRaek9mOERsVGhSeWtFcUMxZWgxaEU1NXVNa21McDNjN25wanpJ?=
 =?utf-8?B?d2xYcnlzeVRWK3NxclFjaFg4T1RMUG9tREFoWHJ0QTVjZlRqR05EMlhKRG5p?=
 =?utf-8?B?K0Z1RytNcDJqUmxqQzhMekZlbVkwa3NsVDk5THJscGZkWXZqRDBnYW1qLzhp?=
 =?utf-8?B?NDVEY2JaUEFFeVRBem13RTVxaXQ5ckJ5YnMvQWE2YzRIZnZ5eURZQ3pqSEli?=
 =?utf-8?B?WHliMEY4RXNEMUUxNWVBS0RBUUFQSXhiQzlxd3hOMTdCaXNUSVBMTElId3NT?=
 =?utf-8?B?WmgrWG11VHBudVR5UHRKTEdnYlpkNmZXTDVpWjZlMmFVR2NPc1VDQm5qRlN5?=
 =?utf-8?B?QkJqTU5wK2NXV3RmUjdDdzJoT0xSY2NKUHNIOFVSVUlrZFd0OFFLUnp4cEFS?=
 =?utf-8?B?YkVMSTcwaDM3VHVWMWM1ZjlPS0NhVloweG1kZlVpTmtBUW5WeWFlemViWlNk?=
 =?utf-8?B?UVc1WU5qdmZZMXREd2hiUDI2WnRyRkZpT2dzL0RJVDd6cXlaNkFlc24vQk96?=
 =?utf-8?B?bW40NUVsZkNiQkRrYTNKUWprTXd3M1BCSUlWWDdoN1Rid05JYTlkT3ZFcDBj?=
 =?utf-8?B?UFdycjZoTjdWbVJRb0tQaEhMOGl6L2FuUm1XMnVaQ1Fmb1NtWnFGYmQ1OWRn?=
 =?utf-8?B?NUZYWEtiaHFtNXpBR2FrMnlQRGJXMk5MK3lndDM3cjJ1VTdjelhWajRNTG9E?=
 =?utf-8?B?ajhmaFhSTGd6SUFpOXZwOVFXcUpoTC8rR1FISDZvSW5wSEx6UkttYzcwUldj?=
 =?utf-8?B?T2s4YUNjRitzSjZkdTNydHNPR1NVd3dnSlE5WHMwQ2IyWnVTemxLeGpvLzJy?=
 =?utf-8?B?Y1k3UlVKNjY4NVRwVG85WjYzMjlISTl5VGpTVjFVNnY2SEhOVVJSTFFZVFNJ?=
 =?utf-8?B?UFhMU3R1d0IrVkFadXBGUjFSN3h1c2Q4MkJYTHEwWWpCWkMydjVpMnVIY21k?=
 =?utf-8?B?V2hEQ0MzNTNvSWZXaldmeTFBOTBnQlFnK0p5K2VaVnNXeW9kVTJxRWFDMFd1?=
 =?utf-8?B?ZW5uVERjbFc1OWlydVcwbWxEU2pEak1yL1JMemg4R2RaSFN6OUZpNzFNR3J5?=
 =?utf-8?B?RmFvUFkyTUZZdlVYaFF5ek9NQ0Y2UTJOR2M4RWNMTzE0M2I2TlU0K1Jab1Rv?=
 =?utf-8?B?bGNSSXVrdGFaekFYOU05c1pPcDBodkhNbXdqN1J4ZEhFT3ZEeU00eVhJU0VT?=
 =?utf-8?B?bm9yMEhWbmJ2bGlRbEtkVWJlMExIK1BRa0E5bHFVcGptaURScm5ZelBENkhY?=
 =?utf-8?B?UGpCQk5SS3FURHkwVG95V1ZteU5QZkdEQnd6MGRhaUl5U1dmTTEyYld0YUJE?=
 =?utf-8?B?YWRRR0MyY2ZCaVlETE9pSzIvcjFKQU4rYlZJc2IwVVJPWnYyZkxqaDgrQy84?=
 =?utf-8?B?UDRUelpwVWRkRWR6ZXlFQ0VEdUE4VG9CVVZ3b3dVc2lBdU9IYWpuVzZwbTdR?=
 =?utf-8?B?bGpUK3NuM1grSU1lQUxxSWlrelRTTUx4VnBIT0lMcGJ4RmZ2akNzcDBSUmtr?=
 =?utf-8?B?eXRYUWpMc0w3Y0lxMUJoMmp1R2FKSytwMGZ3UGVZbnI2ak9Xd1JDS3E0Uzhr?=
 =?utf-8?B?eWJyTFpLTHhOOTZoNGRWVlhBWWxTU0kyNUR4bHF6NjZ3a284Tk8yQnFHT3Mr?=
 =?utf-8?B?OWlibXR3bzFBMlo4NDdFWE5PWUhQbWtJSFNBZVphajJVRkJLYkhlUWswc2Vz?=
 =?utf-8?B?U2lLUWhWbGNtaFQ1SmpZQzlRSy85NzdqT3o3M3BjanJ3SzNxSXJmSlZuWUlp?=
 =?utf-8?Q?/yr8kjCcraQdSXoDC7Pw9TS6n40lU3VcM4dVkFqHfofK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8199F94E123D884D8E738EDBCB235D9A@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67572ea0-f2c5-46af-671a-08db362f0bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 23:39:49.5576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gje5Dmyf0jxZAOe3Cg1Kr78B7gtnCmDgymny3QBbnSGPv20+tAjfiJHICYOgOINm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1428
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 59z6EgKFFcdMx7m--w3t1G_AaCNuYRIj
X-Proofpoint-ORIG-GUID: 59z6EgKFFcdMx7m--w3t1G_AaCNuYRIj
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=987 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050211
X-Mailman-Approved-At: Thu, 06 Apr 2023 11:11:33 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Hawkins, Nick" <nick.hawkins@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KVGhhbmtzIGZvciB5b3VyIGFuc3dlci4gSGVyZSBpcyB0aGUgcHJvY2VzcyB0
aGF0IEkgcHJvcG9zZSwgbGV0IG1lIGtub3cgaWYgdGhhdCBkb2Vzbid0IG1hdGNoIHlvdXIgZXhw
ZWN0YXRpb24uDQoNCi0gV2Uga2VlcCB1cHN0cmVhbWluZyBpbnRvIDYuMnggYW5kIHdlIHdpbGwg
d2FybiB5b3UgYWJvdXQgbmVlZCB0byBiYWNrcG9ydCAoSSBob3BlIGl0IHdpbGwgYmUgZWFzeSBi
dXQgSSB0aGluayBpdCB3aWxsIGJlIHRoZSBjYXNlKQ0KLSBJbiBwYXJhbGxlbCwgd2Ugc3RhcnQg
ZW5hYmxpbmcgc29tZSBvZiBvdXIgZ2VuMTEgbWFjaGluZXMgaW50byBvcGVuYm1jIHJlcG8gYW5k
IHBvaW50IHRvIHN0YW5kYXJkIG9wZW5ibWMga2VybmVsLiBXZSBoYXZlIGRlY2lkZWQgdG8gaGF2
ZSBhIGZpbmUgZ3JhaW4gcHJvY2VzcyB0byB1cHN0cmVhbSBhbmQgZG8gaXQgb25lIHN0ZXAgYXQg
YSB0aW1lLiBUaGF0IG1pZ2h0IGxvb2sgbGlrZSBhIGxpdHRsZSBiaXQgb3ZlcmtpbGwsIGJ1dCBJ
IHRoaW5rIHRoYXQgd2lsbCBiZSBlZmZpY2llbnQuIA0KLSBXaGVuIHdlIGlkZW50aWZ5IHBvdGVu
dGlhbCBib3R0bGVuZWNrLCB3ZSBkaXNjdXNzIHRocm91Z2ggdGhlIG1haWxpbmcgbGlzdCBhYm91
dCB0aGVtLCBhbmQgZ2V0IHlvdXIgZmVlZGJhY2tzIG9uIGhvdyB0byBwcm9jZXNzLg0KDQpXZSB3
b3VsZCBsaWtlIHRvIGFwcGx5IHRoZSBzYW1lIGFwcHJvYWNoIHdpdGggdS1ib290LCBpZiB0aGF0
IGlzIG9rIGZvciB5b3UgPw0KDQpKTQ0KDQrvu78NCg0KDQo=
