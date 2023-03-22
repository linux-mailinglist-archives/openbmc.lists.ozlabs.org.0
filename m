Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 674696C460A
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 10:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhNDd28FVz3cL0
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 20:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=PEw05rnA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::701; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=richard.tung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=PEw05rnA;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhNCy1ZQ1z3cBj
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 20:17:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVlWog0mTjhrk7Zv/sjq5WRGOuTuVDjyBobyRpkVoiTKkr+w2/w6MGrVIrUemxEOM0ZG2+O079wbcZCu1H0TTVlPn9Ppo4Iwec43ghyhuElFYgwudYMB0rZiwiZsMX+LYbAA+4/BM8ziTC7iOqc1agrIm9UmpWMnRCdI7KDrkJdDVr2JLuNWQLKTHXfdT5nhzzRYkO7vHNyPxmI4DVkkD16YXV7yMfb04VeRVYmj6/aE4832U6bQ2v7Q1Bj0bpkclBHW+BUGP6deStcQBXv44TRTpu3BBdWXn4WaY3mUlbsHtvGixvfWT1xpF2xLxrQuwRvlkbwND2YDpWQhylMgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezOx/KsZeeOQ3sVbTHQSj2Lxe+yVA3W7RslPpc15JKQ=;
 b=iLAYXDTntdgxo5a9i4iVMbdswh7wuERGhlBsieyUrXmVQZdYPIj205d/sEXa4+JfEQPGTgYBT3zhcwjbFjf4XY3FcsEpdpoRb01zAzGs/jOfED0nSu6PmNOl0FJx1dxcOr2RnqL5/d0sEXq80dagNJXEl6v/olWGOqThB7H/ylhuNLaa/oh2ocOqWeYBc+n4Sn3ML2PccGHZ1An+TS09gn/H7/z267U0nicCeaNwHTUaHP1OVA29THCqdn+o2pyhJmKd6PUB+VsdX28d+4c7Tl7ymsIrpC+bYki2u0ZLnvWB/vTpCtccZ01rTdOxpesI7toU2gYkfYRJA2vlJaEpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezOx/KsZeeOQ3sVbTHQSj2Lxe+yVA3W7RslPpc15JKQ=;
 b=PEw05rnARjkT8HDe8qh8blyRL1hH4GbxZ7UnfG9PzpQ2EOs3DZYTj9Q5WprCfELEh+VRE750f8Sniy8qAVK/4PEDac9imUpkrmAe/LKhkbG1y/Ms/DGs/c9q7BWcwMAiaXtUfjvAQ+lS+fy7SCw78NMYARFQUfZ97Ni39U48e/s=
Received: from TY0PR04MB6357.apcprd04.prod.outlook.com (2603:1096:400:32a::13)
 by TY0PR04MB5765.apcprd04.prod.outlook.com (2603:1096:400:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:17:13 +0000
Received: from TY0PR04MB6357.apcprd04.prod.outlook.com
 ([fe80::340d:ffd8:9b89:a459]) by TY0PR04MB6357.apcprd04.prod.outlook.com
 ([fe80::340d:ffd8:9b89:a459%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:17:13 +0000
From: =?big5?B?UmljaGFyZCBUdW5nICi4s6vbq8wp?= <Richard.Tung@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	=?big5?B?TGl0enVuZyBDaGVuICizr6dR2nop?= <Litzung.Chen@quantatw.com>
Subject:  =?big5?B?pl7C0DogW0V4dGVybmFsXSAgUmU6IFF1YW50YSdzIENDTEEgU2NoZWR1bGUgQSB1?=
 =?big5?B?cGRhdGUgMjAyMy0wMy0yMFdheWxhbmQuTGVlQHF1YW50YXR3LmNvbSA8V2F5bGFu?=
 =?big5?Q?d.Lee@quantatw.com>?=
Thread-Topic: [External]  Re: Quanta's CCLA Schedule A update
 2023-03-20Wayland.Lee@quantatw.com <Wayland.Lee@quantatw.com>
Thread-Index: AQHZXJ8WyhzK2MIemkKXzYkUvYMAfw==
Date: Wed, 22 Mar 2023 09:17:13 +0000
Message-ID:  <TY0PR04MB635735F6211AD9C0D8748A0EE9869@TY0PR04MB6357.apcprd04.prod.outlook.com>
References:  <TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
 <f93b92cdf5eb0066d3f1e48fa4d88539c29e5977.camel@fuzziesquirrel.com>
In-Reply-To:  <f93b92cdf5eb0066d3f1e48fa4d88539c29e5977.camel@fuzziesquirrel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR04MB6357:EE_|TY0PR04MB5765:EE_
x-ms-office365-filtering-correlation-id: 245d3af3-5c13-4c2d-d106-08db2ab63922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eV/87PGvq/i3G6OO3zOrTwU+7hRCaV6PRVPocP23E7koxlt+qyKzpyhSAnH+Dc5Vubi8ekO/oyEFZYh22pdcfIkOthwyWSt9+NbQ/n3j3Fu80ZKQsBab/pBdMbUkdPvLESgJrexF4CC6peWV5qWt60pDg4FwMjmXtFuygyhPWMQw65MUG8ou9hlNY2VcPzy35W3gZOTOjjwb3PNY/K38kFCOEpuhnO1h+u9kJGpREcKbXco/NHg+aTq+ZQEKRN18AS+IAyLHrhUF4Y8YYklGwXux2eu7jksx97gp7Qf77QkcOfCkI3PVWe/Ugz+h6oqSo76Xw9VV3jj1eZw0JX2wCerlScHJC5w029DeIs2Y8sTWNl7XkhIJYysdNk+1Vm/zGJ39DaK1tWL7GukAb38wMx2KrPe4yabK0JTd8kkJsTvD/YkE1pSI4rlRWUEozsKw240nBwEd0XqvKtLO2uklAGrKDEhzcXCy9F6ztSU5kTjqL26t4rDudaWzQ9Z2O/+YDwk6q5O3jeIPb5oSf+isvgrfUS1muEvE836A9hfNyltGeDuWj0HVLcdmFQCoQpLuegaW0FvLmgCSBjpCNfGKPfRxTb/37ctIdnjXnyUPx2q/H+sj1GMvznHvJwskiDyFnWGVvWOU/uMFFgaqOUmCjw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR04MB6357.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(110136005)(6506007)(26005)(19627405001)(107886003)(64756008)(52536014)(4326008)(76116006)(316002)(71200400001)(66556008)(83380400001)(91956017)(66946007)(66476007)(9686003)(186003)(54906003)(66446008)(478600001)(6636002)(41300700001)(8936002)(99936003)(5660300002)(122000001)(2906002)(15650500001)(7696005)(38070700005)(38100700002)(86362001)(224303003)(55016003)(33656002)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?SmtwbFRIanZvNy9oTjZBQ2JlRDFsajJDTnM4a3E5bHpuWHkyelBrOGk1VHRHNHBT?=
 =?big5?B?ek1vdGhxcXp3VktBUlB5eGExaHBwaWtPYzZoNG5XbVpNbDNZMkl3bW5QbDBnUWxx?=
 =?big5?B?RkZmOWgxNnZqMk4ya0NQSjg4b0pyQi8yN0V3NkdjT2xjeEVIMVBDUDFEQ1lVMFY2?=
 =?big5?B?blRPVE9PQVg1M1FCNklHUHlVYm5ad0lrM0tVQkw4MG9LS1I1V255SU9laDJUUXdC?=
 =?big5?B?OVRranppUFVsbmNvazl1V0xlNWdobTRqWjM2M1o2ajdjL0pJaWlXNDBKZzJieUQv?=
 =?big5?B?cXRjZzdtdWloVmxlMDg4NmQ5T080MFNGQ3ZZYlFEbmxLZERxZG9QWmFZRGNtTXNM?=
 =?big5?B?dGFMTXBsTGN6eXVja1VaTFIyUTRFWTBpVm1lOWJ4WWJTbW5XU1ppdnBDcFNQSzF6?=
 =?big5?B?dHFHYXRQT1hTRTRGUVFzYVFDcVNmT0Q5a0dPRWRPSmhoRzhSMDlBSGFHOEg1RnJ5?=
 =?big5?B?ODJJbHcxRFc5MEM3RHEvOEtObHh0YThOVXlRYjBtVkNwUHpCNE9MeE1tNVZycjVT?=
 =?big5?B?d21HeVJzNTBSaVRMNVlNaWNtWjlIOTRIYmMwQll3UlA2MGJjTmpqZnZhOWx3STZq?=
 =?big5?B?NjRocWxjRGxVdG1kWTR4bXhzb2JmY2FVL2NCSlRZMHZkTFJwL01iNnUrOVRJLzUr?=
 =?big5?B?ay9oY0Uxa051eHNDVHZYaElTbEFHYlVnbjhYalFlMGpENmhLOUxVUk0xWkpZaVBF?=
 =?big5?B?TGQrSFJWZ3Vyb2lROGRnQUZyRmpMU2dyakRPMzU5ZjlteWNDZ2NRVzNiV05xa283?=
 =?big5?B?OERPYllEUEo1d0F1bGFsdkZtZ1FRWjA3UHdncW9zWDJ3NC9oNkNKWFl0Ui9vRkxU?=
 =?big5?B?SGU3MEtvQXF0Y1Y0OWxTeFoweE1lSGJ2MGJSZjJkYk5HMHVJWGpSdE9xS3F6TlV0?=
 =?big5?B?aGxPUHdhY2F3ejVyNUlIVWdDS0JHN2Z5NlhXRE9ISEZ5VFRreG8vZk9TY3pYWkFk?=
 =?big5?B?ZmNCaXFFbmVtQW03U1JUNFRQUTQwRktTcDg1SHBrb3hTVE9nVXFoSmFLc3dMLzhw?=
 =?big5?B?OHZYbnVQMjlLY2REZG5sTk1UMjljdmE4dEx6aUtqdXVvcE0zVkl3MXpOM3I3eTNP?=
 =?big5?B?NlBHMFBmYzVSNFkxVmh2WUhQTnVpd3Vyb1AwUGQrdUFqQWYwd3hDbFBvWVZuenJ0?=
 =?big5?B?ZnhMQVVHajdhOWdLVWl4Qm55MEo2TStnejZNTi9GU2NYbWQzQkZsSHNiQXBYaUIz?=
 =?big5?B?Z2E2RTFMcWtlTFAvVm5FM3dwdm9IVUQrTnJPMkJhOVVpaEFrUlUvZVJaS1JXQUcr?=
 =?big5?B?OWFBQm1NMTg2QmRBSGpLczh6U0pnQUwwaUVaNVl5T3ZUVjhhd0VPR3B3cnBMNUJt?=
 =?big5?B?L29VTVNBNitsOGR6bjJ0Zmp3VGNPUlVwZVZEK1ErcTF4Y1l4L0liNG9jc1FtTjhR?=
 =?big5?B?Ym5nU0MvZC9qK2k4bjJra3h3dXZKa2VQMElTb3pZaWlQMUNoaDJTZXNEbi9qNTc2?=
 =?big5?B?UTlGbk5KcXNEUjB4OU5RbTVFaUFaSnEzbExXYjdHYXB4MlFNV2VpWnQ2eHpOQXlY?=
 =?big5?B?Tlp3WUpTYWdVcWJRZWVOV0VReklYN3FselNTSTFSaXhzclh4S21xVk9saFdQZnJK?=
 =?big5?B?MXBoNG1ha0hsZ2N5aFMwbFhqaWVuSlFFMDR4ckg1VU9OWlMvZkRxRFh4ekQvY1Vn?=
 =?big5?B?eHd1VDFJYkZoMGpaYTkrMExhNTRSUElNYjFLUEhKS0ROZ3pIWGFOa25LeEZqNE5n?=
 =?big5?B?ZGxsOGlpc0ttbCtDT0lqSjI3SmtEbUo2NnRJN0pkK3M3MndQd1BJcW5ZRzl2V0JB?=
 =?big5?B?TDI2SnpHU3U0MEx4bUFFQllEZ3g5aTV4d2owa05CTStwOWphbThFb04wUHd3K1Fz?=
 =?big5?B?dWxvNG1OcmJYSjNMb2dsUEszTlZxaThHZFVqbWNFSzFDWmZ3clN2STVZbElQcE9t?=
 =?big5?B?RFdFbWFzcEloSlE4M0tJQi81WFBpcW5aUU5rNENYaDlLRXc4ckxtMlJzakVvUCtk?=
 =?big5?B?OW9QRXpQWEhpUFozY0c1TWxRNFAyTGJ3bVR5b3d6N2tZTUVLQWY4cmJpSmtFcWE5?=
 =?big5?Q?xAei64G4JJhnO/QH?=
Content-Type: multipart/mixed;
	boundary="_004_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR04MB6357.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245d3af3-5c13-4c2d-d106-08db2ab63922
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 09:17:13.3742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6U4USk3Aa9c50qBM5UELVwKRX2qcV+PVXTChz6Ln9Hu4H6KBMqHHsHIziZOoPHLtmjWZqoI6uuwLL2iTTwxuM/pqymc2wXIe8XZnlTXCF5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5765
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, =?big5?B?UGh5bGxpcyBMdSAos7CpybipKQ==?= <Phyllis.Lu@quantatw.com>, =?big5?B?U3RldmVuIExpb3UgKLxCsE+6fik=?= <Steven.Liou@quantatw.com>, =?big5?B?V2F5bGFuZCBMZWUgKKf1rmHesyk=?= <Wayland.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_
Content-Type: multipart/alternative;
	boundary="_000_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_"

--_000_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCkkgd291bGQgbGlrZSB0byB1cGRhdGUgUXVhbnRhJ3MgQ0NMQSwgc2VlIGF0dGFj
aGVkIGZpbGUuDQoNClN1bW1hcnkgb2YgY2hhbmdlczoNCi0gIEJ1ZGR5IEh1YW5nLCBCdWRkeS5I
dWFuZ0BxdWFudGF0dy5jb20gQ0xBIE1hbmFnZXINCisgTGl0enVuZyBDaGVuLCBMaXR6dW5nLkNo
ZW5AcXVhbnRhdHcuY29tIENMQSBNYW5hZ2VyDQorIFN0ZXZlbiBMaW91LCBTdGV2ZW4uTGlvdUBx
dWFudGF0dy5jb20NCisgUGh5bGxpcyBMdSwgUGh5bGxpcy5MdUBxdWFudGF0dy5jb20NCisgV2F5
bGFuZCBMZWUsIFdheWxhbmQuTGVlQHF1YW50YXR3LmNvbQ0KDQpQbGVhc2UgaGVscCBvbiB0aGlz
LCB0aGFuayB5b3UuDQoNCkJlc3QgcmVnYXJkcywNClJpY2hhcmQgVHVuZy4NCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCrFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2Vz
K3JpY2hhcmQudHVuZz1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZz4gpU6q7SBCcmFkIEJp
c2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPg0KsUil86TptME6IDIwMjOmfjOk6zIx
pOkgpFekyCAwMzo0NQ0Kpqyl86rMOiBMaXR6dW5nIENoZW4gKLOvp1HaeikgPExpdHp1bmcuQ2hl
bkBxdWFudGF0dy5jb20+DQqwxqW7OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFtFeHRlcm5hbF0gUmU6IFF1YW50YSdzIENDTEEgU2No
ZWR1bGUgQSB1cGRhdGUgMjAyMy0wMy0yMA0KDQpPbiBNb24sIDIwMjMtMDMtMjAgYXQgMDc6MTkg
KzAwMDAsIExpdHp1bmcgQ2hlbiAos6+nUdp6KSB3cm90ZToNCj4gSGkgQnJhZCwNCj4NCj4gQXR0
YWNoZWQgaXMgdGhlIHVwZGF0ZWQgU2NoZWR1bGUgQSBvZiBDQ0xBIGZyb20gUXVhbnRhLCBwbGVh
c2UgaGVscA0KPiByZXZpZXcuDQoNCkhpIExpdHp1bmcNCg0KWW91IGFyZSBub3QgbGlzdGVkIGFz
IGEgQ0xBIE1hbmFnZXIgb24gdGhlIG1vc3QgcmVjZW50IFNjaGVkdWxlIEEgd2UNCmhhdmUgb24g
ZmlsZS4gIEZvciBib3RoIG1pbmUgYW5kIFF1YW50YXMgcHJvdGVjdGlvbiwgSSBjYW4gb25seSBh
Y2NlcHQNClNjaGVkdWxlIEEgdXBkYXRlcyBmcm9tIENMQSBNYW5hZ2Vycy4gIENhbiB5b3UgcGxl
YXNlIGhhdmUgb25lIG9mIHRoZQ0KZXhpc3RpbmcgQ0xBIG1hbmFnZXJzIHNlbmQgdGhlIHVwZGF0
ZT8gIElmIHlvdSB3b3VsZCBsaWtlIHRvIG1ha2UNClNjaGVkdWxlIEEgdXBkYXRlcyBhZnRlciB0
aGF0LCBoYXZlIHRoZW0gYWRkICJDTEEgTWFuYWdlciIgbmV4dCB0byB5b3VyDQpuYW1lLg0KDQo+
IEFuZCBJIHdvbGQgbGlrZSB0byB1cGxvYWQgdGhlIENDTEEgZmlsZSB0byBRdWFudGEgZ29vZ2xl
IGRyaXZlcg0KPiBmb2xkZXIuDQo+DQo+IENvdWxkIHlvdSBhbHNvIGhlbHAgbWUgdG8gYXBwbHkg
cGVybWlzc2lvbj8NCg0KSSB3b3VsZCBsb3ZlIHRvIGhlbHAgeW91IHdpdGggdGhpcyBvbmNlIHlv
dSBoYXZlIGJlZW4gYWRkZWQgdG8gU2NoZWR1bGUNCkEgd2l0aCAiQ0xBIE1hbmFnZXIiIG5leHQg
dG8geW91ciBuYW1lLiAgVGhpcyB1cGRhdGUgbmVlZHMgdG8gYmUgc2VudCBieQ0KYW4gZXhpc3Rp
bmcgQ0xBIE1hbmFnZXIuDQoNCkFwb2xvZ2llcywgSSByZWFsaXplIHRoaXMgaXMgYSBoYXNzbGUg
LSBidXQgYWdhaW4gdGhpcyBpcyBmb3IgYm90aCBtaW5lDQphbmQgUXVhbnRhJ3MgcHJvdGVjdGlv
bi4NCg0KVGhhbmtzLA0KQnJhZA0K

--_000_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi Brad,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I would like to update Quanta's CCLA, see attached file.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<b>Summary of changes:</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
-&nbsp; Buddy Huang,&nbsp;<span style=3D"background-color:rgb(255, 255, 255=
);display:inline !important" class=3D"ContentPasted3"><span class=3D"Conten=
tPasted3">Buddy.Huang</span>@quantatw.com CLA Manager</span><o:p class=3D"C=
ontentPasted0 ContentPasted3">&nbsp;</o:p></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
+ Litzung Chen, Litzung.Chen@quantatw.com CLA Manager<o:p class=3D"ContentP=
asted0" style=3D"color: inherit; font-family: inherit; font-size: inherit; =
font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: in=
herit; font-weight: inherit;">&nbsp;</o:p><br>
+ Steven Liou, Steven.Liou@quantatw.com<o:p class=3D"ContentPasted1" style=
=3D"color: inherit; font-family: inherit; font-size: inherit; font-style: i=
nherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-w=
eight: inherit;">&nbsp;</o:p></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
+ Phyllis Lu, Phyllis.Lu@quantatw.com<o:p class=3D"ContentPasted1" style=3D=
"color: inherit; font-family: inherit; font-size: inherit; font-style: inhe=
rit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weig=
ht: inherit;">&nbsp;</o:p></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
+ Wayland Lee, Wayland.Lee@quantatw.com<o:p class=3D"ContentPasted1" style=
=3D"color: inherit; font-family: inherit; font-size: inherit; font-style: i=
nherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-w=
eight: inherit;">&nbsp;</o:p></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t" class=3D"ContentPasted2">Please help on this, thank you.</span><br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:10pt;=
">
<div class=3D"PlainText">Best regards,<br>
Richard Tung.</div>
</span></font></div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>=B1H=A5=
=F3=AA=CC:</b> openbmc &lt;openbmc-bounces+richard.tung=3Dquantatw.com@list=
s.ozlabs.org&gt; =A5N=AA=ED Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;=
<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2023=A6~3=A4=EB21=A4=E9 =A4W=A4=C8 03:45<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Litzung Chen (=B3=AF=A7Q=DAz) &lt;Litzung.Chen@q=
uantatw.com&gt;<br>
<b>=B0=C6=A5=BB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;<br>
<b>=A5D=A6=AE:</b> [External] Re: Quanta's CCLA Schedule A update 2023-03-2=
0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, 2023-03-20 at 07:19 +0000, Litzung Chen (=
=B3=AF=A7Q=DAz) wrote:<br>
&gt; Hi Brad,<br>
&gt; &nbsp;<br>
&gt; Attached is the updated Schedule A of CCLA from Quanta, please help<br=
>
&gt; review.<br>
<br>
Hi Litzung<br>
<br>
You are not listed as a CLA Manager on the most recent Schedule A we<br>
have on file.&nbsp; For both mine and Quantas protection, I can only accept=
<br>
Schedule A updates from CLA Managers.&nbsp; Can you please have one of the<=
br>
existing CLA managers send the update?&nbsp; If you would like to make<br>
Schedule A updates after that, have them add &quot;CLA Manager&quot; next t=
o your<br>
name.<br>
<br>
&gt; And I wold like to upload the CCLA file to Quanta google driver<br>
&gt; folder.<br>
&gt; &nbsp;<br>
&gt; Could you also help me to apply permission?<br>
<br>
I would love to help you with this once you have been added to Schedule<br>
A with &quot;CLA Manager&quot; next to your name.&nbsp; This update needs t=
o be sent by<br>
an existing CLA Manager.<br>
<br>
Apologies, I realize this is a hassle - but again this is for both mine<br>
and Quanta's protection.<br>
<br>
Thanks,<br>
Brad<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_--

--_004_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_
Content-Type: application/pdf; name="Quanta_Schedule_A_Update_2023-03-22.pdf"
Content-Description: Quanta_Schedule_A_Update_2023-03-22.pdf
Content-Disposition: attachment;
	filename="Quanta_Schedule_A_Update_2023-03-22.pdf"; size=49747;
	creation-date="Wed, 22 Mar 2023 09:14:25 GMT";
	modification-date="Wed, 22 Mar 2023 09:15:20 GMT"
Content-Transfer-Encoding: base64

JVBERi0xLjcNCiW1tbW1DQoxIDAgb2JqDQo8PC9UeXBlL0NhdGFsb2cvUGFnZXMgMiAwIFIvTGFu
Zyh6aC1UVykgL1N0cnVjdFRyZWVSb290IDE3IDAgUi9NYXJrSW5mbzw8L01hcmtlZCB0cnVlPj4v
TWV0YWRhdGEgNjMgMCBSL1ZpZXdlclByZWZlcmVuY2VzIDY0IDAgUj4+DQplbmRvYmoNCjIgMCBv
YmoNCjw8L1R5cGUvUGFnZXMvQ291bnQgMS9LaWRzWyAzIDAgUl0gPj4NCmVuZG9iag0KMyAwIG9i
ag0KPDwvVHlwZS9QYWdlL1BhcmVudCAyIDAgUi9SZXNvdXJjZXM8PC9Gb250PDwvRjEgNSAwIFIv
RjIgOSAwIFIvRjMgMTEgMCBSPj4vRXh0R1N0YXRlPDwvR1M3IDcgMCBSL0dTOCA4IDAgUj4+L1By
b2NTZXRbL1BERi9UZXh0L0ltYWdlQi9JbWFnZUMvSW1hZ2VJXSA+Pi9NZWRpYUJveFsgMCAwIDU5
NS4zMiA4NDEuOTJdIC9Db250ZW50cyA0IDAgUi9Hcm91cDw8L1R5cGUvR3JvdXAvUy9UcmFuc3Bh
cmVuY3kvQ1MvRGV2aWNlUkdCPj4vVGFicy9TL1N0cnVjdFBhcmVudHMgMD4+DQplbmRvYmoNCjQg
MCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggMjI3MT4+DQpzdHJlYW0NCnicvVtt
b9s4Ev4eIP+BH6WDzYrii6hFYTROmnab9HC3yWE/LA6FLlZjYx2pTawuur/+ZqgXy5EYCC3pBbKW
SErz8OHMcGbEklc3X7KCvH796uP5rxckenWdFfckyIv5f27CxYIsL87J19OTiEb4n9YJIxGRqaQ8
JlowmsbkMT89+f0fpDg9Wd6enry6ZIQxGgly+/n0BEdHhJEkplEsSCJTyqHnAca9u0nI/RO8mtyb
O93cvTs9+SO4CUVwt85DHqwq+N82lEFOzsL/ktsPpydvQcy/T08cwGKxpryPyoBpMJBDceTtx3NC
DuliDuiKiaKpOoCloEUjW4wy/SO4Yie4UhsueCD5EVjcs3bFo+v4azgXQbEJVbDDqw3oUraFO4J3
qFnY8mT6TFMZMh587m5XqIVPm5DJ4D6c66DI4H4Hz+cruDBDcnziIZzz4Au+uPyO97l5jnbv+SdI
WYJa/9K1ZFXIRA1qXcLgR3wDgvk7ZCzIdhtsLMjmiRQltjQQe/PYQ9h1yM3tl8y8L9kPvasQWvZI
fsqI+AvsMzHC/usoitVCwo+M4Y8tOF4mi7nAX7mY4704NyOEhCZ9MKLp6T+rooixhYLLiNeDOF+Y
sZf1WzT8iW4s3kYc39S9QiQL1heLowTKbEcv5ti+5DW6Bn98CX9iwQ4kRwumXzePNy+HS3G2mCcN
FAmTWgrzhvYpybCrRrhcMNabLwxRfYJi06T7jCy7hw/eB8jMddRQ2kxbxgsW4X16IKAHWJ7XENq3
GdBwK3nz5OV+Cc4b4vR+Aqr3ZLMAzZqpHmhtWG9Au/bijQKqdNT8/5c3G0iJ1vsX2vHeYtatMdcG
+QiWHHXGyTvbBDM9NE6r4WXYsSIlvsc8gvZqLvKH8hu25mSVoztRwX0BY7NdviKm3+5E8B3gkFoU
ZT0y6c8Dm4wf+zn7HqNXCE5jZaN3xIHibUFC3UDLDVW+Fl0LKtQAlXHf1a7qliGn7oOHCHiJbQgm
bIfC73aoVPqDwKST8IHFY8GDkpwmPxRsKR+oEkAlABXn8DtA9Vs4j4PNHXgJMOIVuYXtuyrCeQqR
ACjWjBz209twLmGA6XzztUJ/k8EjxS7b/UXv0KgfyLmx4+szNIqP6H0gnpjL+oU5Xj3+lKIOJshV
QiNum+AE2hOftEPMwIaortHFbnZot3/3KEXuYvQnQOmM4DJYBlIkuR0JC5GhQ+ovgluKYxiupW0y
NZZjLrik8JwFzYQF1x4XXKYQJLIBqovqzxw34YtqRi7QyP7EpaO4xBfVG+AM13B+uIiO11BomnIb
vgmspT5ZSwSVQ1SX6HUyiAMKYwzvn4C9S7iFDU/VjodCm3FEycAROaZPRpQnNqBTMmkXlQcrf1Kg
STyH9Q51rjRsNdZoAhhgEp180jr5/jCjlu+x82U379rBMKqkbRpT2HVTqLCwywVNh7D+hV6ZXlGC
bF2HMau9HTI4I21n3YcBdSjq/tZd4zp4tHYI3VIb8imEuqmwWAhlkrIhrBuTG5g97c6wBekAuQKu
wOx7fUhc109Ra6+MAxjZBx2TCsaPPmAc/RRSXdSHbKQKfGoI67Ys0H6/h3EU7EOKnqaaAawZQYcj
juMAwPI5t81hCrUucg0rtYkc8/q/I0WbLWrmlgBpabDJ+n613w/EAqnGS/QHvUFqUW+9kguZCZI7
Posp5HrJl1pypRxz+heYcnzbrJDFZnNvaL1oG6D3WadxAXOvXOqIKmYDPYVLn1me4BCop2MReoyV
IPCX29zUUEwoNWiGaArtvzqCJ01xv7fAncKiz6RNMEWjISyzBeHG81gW5HzdV8mmC3OdsqDYh7H8
EeMnrXBnsgCfwqfPnIinCoOR57Dem6LCt9ykj/X+ZDwmaCZ0AaEHfbTuO4JqxpgnWTBPodJnosTh
VwxhvV2tNj9fhRwIZZGmUWwTajYzWCwUDutUpxf7AKI6UuBg8jILxClfEn3mZVwqqoawzraGFHJV
lTNyBpfbrPh0hWWB8s1X5Mx3QCA1ul8Luimk+Uy3OFdju8ISE//qDvesLo99HssusRcHJabhE6hl
2k+/xLECLm58yPhEpvDrM/viLBnbJT50Nvz5c/29KG3i1WJGPhhH3HSCa67rkkWM7rjYtWZu6BQe
kll4XNpwT6HTZ94Vp8nYTmGCq/LpoXTskvFrSGwT6tr/M/GCsDp8LCvHMnGxlU3mzPUMhXpB2n4N
4ZdiNFfPGa/KI4QiOkH/PG2tR/XeZ1IcJ8nYlnvjlgPNqVJWYbvsDr1RHTyanMaxenBGE32kqTKu
qbTPFDNdmC2TbaXGrXDFqLTy/N6xsCTCc18WYVjRN2mo7yAopQm3gZhiXT6rIrEE23/+bZsAbfCq
2zvYrR3vK+BqEpvYP4J1QepQwL2FxdKowrjcOiYp18WnfTRS+9258vqtLEWPawE1RTV8FnlinlA9
hGW+OJS7Df7gcuEJuxDPqjheL4ZnQiwYZq6FiReEOdfE5AVhB+zSThsNwybRBT195q/cB8GQTFjg
+cmqpxE/agA+63Mx0xi0DbPqbV5gCYm3FWHH27PE8wYW4a41H2IBuzDnQTB7QZih9dOe1u500DGK
7Qw/XExjYVQNfZY1Warx2ODgg9vGnIGSdWW9nBFoMPnDvtxe+k8dpKaC2SBOYc5nFZMleuzg3r4C
8fi4D+tN3Terj0QdjmC8XxrO6rNQxyifQawcSdsspvwzAZ81R4bFPWso9YRl4i9rgkdrqpbQtpWa
1qMp5zjQKfz5LD+i6x3Z9Mwnnl3+Dc/KFL3iWFkfTpBdn+vEDGHZQF07lqUFZTZZMFPzDfsIX2A0
en0LjCnq4bN6ylg6thmZ+HCNavE95FGwNV/9N0+kPhtpvofgoSDHQUKKEasF0doUvw/QOK8ZaJpq
m3zXugn8M6uw6qiOfxzDFM30WYhOQRuG52GbvXHelI22WbEivUNp3aeTdpypL6HOGGM3fK5c603K
8QzFOF7HahNHkDbZZOWuZSka22WJvevsuPX1xSSN0IWOIxnT0/8DQ4gSOw0KZW5kc3RyZWFtDQpl
bmRvYmoNCjUgMCBvYmoNCjw8L1R5cGUvRm9udC9TdWJ0eXBlL1RydWVUeXBlL05hbWUvRjEvQmFz
ZUZvbnQvQXJpYWxNVC9FbmNvZGluZy9XaW5BbnNpRW5jb2RpbmcvRm9udERlc2NyaXB0b3IgNiAw
IFIvRmlyc3RDaGFyIDMyL0xhc3RDaGFyIDEyMi9XaWR0aHMgNjEgMCBSPj4NCmVuZG9iag0KNiAw
IG9iag0KPDwvVHlwZS9Gb250RGVzY3JpcHRvci9Gb250TmFtZS9BcmlhbE1UL0ZsYWdzIDMyL0l0
YWxpY0FuZ2xlIDAvQXNjZW50IDkwNS9EZXNjZW50IC0yMTAvQ2FwSGVpZ2h0IDcyOC9BdmdXaWR0
aCA0NDEvTWF4V2lkdGggMjY2NS9Gb250V2VpZ2h0IDQwMC9YSGVpZ2h0IDI1MC9MZWFkaW5nIDMz
L1N0ZW1WIDQ0L0ZvbnRCQm94WyAtNjY1IC0yMTAgMjAwMCA3MjhdID4+DQplbmRvYmoNCjcgMCBv
YmoNCjw8L1R5cGUvRXh0R1N0YXRlL0JNL05vcm1hbC9jYSAxPj4NCmVuZG9iag0KOCAwIG9iag0K
PDwvVHlwZS9FeHRHU3RhdGUvQk0vTm9ybWFsL0NBIDE+Pg0KZW5kb2JqDQo5IDAgb2JqDQo8PC9U
eXBlL0ZvbnQvU3VidHlwZS9UcnVlVHlwZS9OYW1lL0YyL0Jhc2VGb250L1RpbWVzTmV3Um9tYW5Q
U01UL0VuY29kaW5nL1dpbkFuc2lFbmNvZGluZy9Gb250RGVzY3JpcHRvciAxMCAwIFIvRmlyc3RD
aGFyIDMyL0xhc3RDaGFyIDEyMi9XaWR0aHMgNjIgMCBSPj4NCmVuZG9iag0KMTAgMCBvYmoNCjw8
L1R5cGUvRm9udERlc2NyaXB0b3IvRm9udE5hbWUvVGltZXNOZXdSb21hblBTTVQvRmxhZ3MgMzIv
SXRhbGljQW5nbGUgMC9Bc2NlbnQgODkxL0Rlc2NlbnQgLTIxNi9DYXBIZWlnaHQgNjkzL0F2Z1dp
ZHRoIDQwMS9NYXhXaWR0aCAyNjE0L0ZvbnRXZWlnaHQgNDAwL1hIZWlnaHQgMjUwL0xlYWRpbmcg
NDIvU3RlbVYgNDAvRm9udEJCb3hbIC01NjggLTIxNiAyMDQ2IDY5M10gPj4NCmVuZG9iag0KMTEg
MCBvYmoNCjw8L1R5cGUvRm9udC9TdWJ0eXBlL1R5cGUwL0Jhc2VGb250L0FyaWFsTVQvRW5jb2Rp
bmcvSWRlbnRpdHktSC9EZXNjZW5kYW50Rm9udHMgMTIgMCBSL1RvVW5pY29kZSA1OCAwIFI+Pg0K
ZW5kb2JqDQoxMiAwIG9iag0KWyAxMyAwIFJdIA0KZW5kb2JqDQoxMyAwIG9iag0KPDwvQmFzZUZv
bnQvQXJpYWxNVC9TdWJ0eXBlL0NJREZvbnRUeXBlMi9UeXBlL0ZvbnQvQ0lEVG9HSURNYXAvSWRl
bnRpdHkvRFcgMTAwMC9DSURTeXN0ZW1JbmZvIDE0IDAgUi9Gb250RGVzY3JpcHRvciAxNSAwIFIv
VyA2MCAwIFI+Pg0KZW5kb2JqDQoxNCAwIG9iag0KPDwvT3JkZXJpbmcoSWRlbnRpdHkpIC9SZWdp
c3RyeShBZG9iZSkgL1N1cHBsZW1lbnQgMD4+DQplbmRvYmoNCjE1IDAgb2JqDQo8PC9UeXBlL0Zv
bnREZXNjcmlwdG9yL0ZvbnROYW1lL0FyaWFsTVQvRmxhZ3MgMzIvSXRhbGljQW5nbGUgMC9Bc2Nl
bnQgOTA1L0Rlc2NlbnQgLTIxMC9DYXBIZWlnaHQgNzI4L0F2Z1dpZHRoIDQ0MS9NYXhXaWR0aCAy
NjY1L0ZvbnRXZWlnaHQgNDAwL1hIZWlnaHQgMjUwL0xlYWRpbmcgMzMvU3RlbVYgNDQvRm9udEJC
b3hbIC02NjUgLTIxMCAyMDAwIDcyOF0gL0ZvbnRGaWxlMiA1OSAwIFI+Pg0KZW5kb2JqDQoxNiAw
IG9iag0KPDwvQXV0aG9yKP7/AFIAaQBjAGgAYQByAGQAIABUAHUAbgBnACAAXCiEY19lXFxPAFwp
KSAvQ3JlYXRvcij+/wBNAGkAYwByAG8AcwBvAGYAdACuACAAVwBvAHIAZAAgADIAMAAxADkpIC9D
cmVhdGlvbkRhdGUoRDoyMDIzMDMyMjE3MDUyNSswOCcwMCcpIC9Nb2REYXRlKEQ6MjAyMzAzMjIx
NzA1MjUrMDgnMDAnKSAvUHJvZHVjZXIo/v8ATQBpAGMAcgBvAHMAbwBmAHQArgAgAFcAbwByAGQA
IAAyADAAMQA5KSA+Pg0KZW5kb2JqDQoyNCAwIG9iag0KPDwvVHlwZS9PYmpTdG0vTiA0MC9GaXJz
dCAyOTcvRmlsdGVyL0ZsYXRlRGVjb2RlL0xlbmd0aCA2MzE+Pg0Kc3RyZWFtDQp4nOWWz2rjMBDG
74W+w7yBPH9k2VAKy7Zll9IQmsIeSg9uok1CE7s4DrRvv6NMlqbQw1rXBeOxpPl+GslfYhFBAeTB
I1AJWBBQAPQMVAEVAlTrqAcu9CqBEdgHYAIpKmAG8TWwqFrHFVIScAklCnCAslRBBQE1s4YQChVB
RapFqIKAENQ6pzDUoQIRnV2nEa+x0iStBhUtWg5WmlYBkuKk1lgX4AvQYUqFI9daAgGKirR0lLoC
rzyvSVo8lrosr7xSO7V8DLoUUl3wCg1pnSrS9ab5UBfMWivpxbXug15psRcXbppEBdy7mZu6h/fX
6GZDv58P15u4dbePUDyBmy6BU87l5fnZP0hwvITGS3i8RMZL/HhJOV4Sxkuq8ZI641XmvP6M948Z
BsAMB2CGBTDDA5hhAsxwAWbYADN8QBk+oJz/gQwfUIYPKMMHlOEDyvABZfiAMnxAGT7gDB9whg84
54PwpQ/0U2iaq26+38Z2+Np2KSkdGQ6htBAsVBbqQ9CP+SGgBdMxWxALRmGjsFHYKGwUMYoYRYwi
RhGjiFHEKGIUMYoYxRvFG8UbxRvFG8UbxRvFHyhPcNyck4146GO877rB3XebeNe8ppND2rZp0+uW
pdF0hkg9hx+2YU5GJ/FtuI3vgEf0jbLabohukm7X7eKj8aCpz92bm8X54H7EZhF7e06av88/2826
jbNVkypMHd9aJTTDumuP7X5Y/2704dD61fUvz1338vGSU89uFeOQihzcXTPvu5P295XeT9pX62bT
LU86Zpv1Ip7k2jyatuybrbtZL/d9PK51st/uHtOBkz/t7qTZxt2jNf87h52f/QF30ucdDQplbmRz
dHJlYW0NCmVuZG9iag0KNTggMCBvYmoNCjw8L0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGggMzE1
Pj4NCnN0cmVhbQ0KeJxlUstuwyAQvPMVHNNDZPAjycGy1LiN5EMfqtsPcGCdItUYYXLw3xdYJ21T
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
IDQ3WyA1NTYgODMzIDcyMl0gIDUxWyA2NjddICA1NFsgNjY3XSAgNjhbIDU1NiA1NTYgNTAwIDU1
NiA1NTYgMjc4IDU1NiA1NTYgMjIyXSAgNzlbIDIyMiA4MzMgNTU2IDU1NiA1NTZdICA4NVsgMzMz
IDUwMCAyNzggNTU2IDUwMCA3MjIgNTAwIDUwMCA1MDBdICAxNzlbIDMzMyAzMzNdIF0gDQplbmRv
YmoNCjYxIDAgb2JqDQpbIDI3OCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDI3OCAwIDAgMCAw
IDAgMCAwIDAgMCAwIDAgMjc4IDAgMCAwIDAgMCAwIDY2NyA2NjcgMCAwIDAgMCAwIDAgMjc4IDAg
MCAwIDAgNzIyIDAgMCAwIDAgNjY3IDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgNTU2IDU1NiA1
MDAgNTU2IDU1NiAyNzggNTU2IDU1NiAyMjIgMCAwIDIyMiA4MzMgNTU2IDU1NiA1NTYgMCAzMzMg
NTAwIDI3OCA1NTYgNTAwIDcyMiAwIDUwMCA1MDBdIA0KZW5kb2JqDQo2MiAwIG9iag0KWyAyNTAg
MCAwIDAgMCAwIDAgMCAwIDAgMCAwIDI1MCAwIDI1MCAwIDAgMCA1MDAgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgMCA5MjEgNzIyIDY2NyA2NjcgNzIyIDYxMSA1NTYgNzIyIDcyMiAwIDM4OSA3MjIg
NjExIDg4OSAwIDAgNTU2IDAgNjY3IDU1NiA2MTEgMCAwIDk0NCAwIDAgMCAwIDAgMCAwIDUwMCAw
IDQ0NCAwIDQ0NCA1MDAgNDQ0IDMzMyA1MDAgNTAwIDI3OCAwIDUwMCAyNzggNzc4IDUwMCA1MDAg
NTAwIDUwMCAzMzMgMzg5IDI3OCA1MDAgNTAwIDcyMiAwIDUwMCA0NDRdIA0KZW5kb2JqDQo2MyAw
IG9iag0KPDwvVHlwZS9NZXRhZGF0YS9TdWJ0eXBlL1hNTC9MZW5ndGggMzA3ND4+DQpzdHJlYW0N
Cjw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+PHg6
eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iMy4xLTcwMSI+CjxyZGY6
UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5z
IyI+CjxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiICB4bWxuczpwZGY9Imh0dHA6Ly9ucy5h
ZG9iZS5jb20vcGRmLzEuMy8iPgo8cGRmOlByb2R1Y2VyPk1pY3Jvc29mdMKuIFdvcmQgMjAxOTwv
cGRmOlByb2R1Y2VyPjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91
dD0iIiAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIj4KPGRjOmNy
ZWF0b3I+PHJkZjpTZXE+PHJkZjpsaT5SaWNoYXJkIFR1bmcgKOiRo+W9peWxjyk8L3JkZjpsaT48
L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9u
IHJkZjphYm91dD0iIiAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIj4K
PHhtcDpDcmVhdG9yVG9vbD5NaWNyb3NvZnTCriBXb3JkIDIwMTk8L3htcDpDcmVhdG9yVG9vbD48
eG1wOkNyZWF0ZURhdGU+MjAyMy0wMy0yMlQxNzowNToyNSswODowMDwveG1wOkNyZWF0ZURhdGU+
PHhtcDpNb2RpZnlEYXRlPjIwMjMtMDMtMjJUMTc6MDU6MjUrMDg6MDA8L3htcDpNb2RpZnlEYXRl
PjwvcmRmOkRlc2NyaXB0aW9uPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiAgeG1sbnM6
eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iPgo8eG1wTU06RG9jdW1lbnRJ
RD51dWlkOkJGMEQyMzc1LTVDQzItNDVCRC1BRTE5LTc5QzkxNDBBMjI4NDwveG1wTU06RG9jdW1l
bnRJRD48eG1wTU06SW5zdGFuY2VJRD51dWlkOkJGMEQyMzc1LTVDQzItNDVCRC1BRTE5LTc5Qzkx
NDBBMjI4NDwveG1wTU06SW5zdGFuY2VJRD48L3JkZjpEZXNjcmlwdGlvbj4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCjwvcmRmOlJERj48L3g6eG1wbWV0YT48P3hwYWNrZXQgZW5kPSJ3Ij8+DQpl
bmRzdHJlYW0NCmVuZG9iag0KNjQgMCBvYmoNCjw8L0Rpc3BsYXlEb2NUaXRsZSB0cnVlPj4NCmVu
ZG9iag0KNjUgMCBvYmoNCjw8L1R5cGUvWFJlZi9TaXplIDY1L1dbIDEgNCAyXSAvUm9vdCAxIDAg
Ui9JbmZvIDE2IDAgUi9JRFs8NzUyMzBEQkZDMjVDQkQ0NUFFMTk3OUM5MTQwQTIyODQ+PDc1MjMw
REJGQzI1Q0JENDVBRTE5NzlDOTE0MEEyMjg0Pl0gL0ZpbHRlci9GbGF0ZURlY29kZS9MZW5ndGgg
MTc1Pj4NCnN0cmVhbQ0KeJw10csOwVAQgOGp+620VXWndY2ErYfwWt7FgoqFjVhaegiJeA6pY37O
Yr5MMpPJzBExL0ksE12RLzt4KFailBdwVyoxPBU7gJtSPSm1JWzgpTgrxY1EUmZCS8YwgSnMYAS/
yrnp88J/ZkEK0pCBLOQgDwUoQgnKUAEbqlADB1zwoA4+NCCAJrSgDR3oQg/6MIAhhBCZbf23HivY
KvuzcuC68UU58gHXtcgHcO8ajw0KZW5kc3RyZWFtDQplbmRvYmoNCnhyZWYNCjAgNjYNCjAwMDAw
MDAwMTcgNjU1MzUgZg0KMDAwMDAwMDAxNyAwMDAwMCBuDQowMDAwMDAwMTY2IDAwMDAwIG4NCjAw
MDAwMDAyMjIgMDAwMDAgbg0KMDAwMDAwMDUxMSAwMDAwMCBuDQowMDAwMDAyODU3IDAwMDAwIG4N
CjAwMDAwMDMwMTggMDAwMDAgbg0KMDAwMDAwMzI0NCAwMDAwMCBuDQowMDAwMDAzMjk3IDAwMDAw
IG4NCjAwMDAwMDMzNTAgMDAwMDAgbg0KMDAwMDAwMzUyMiAwMDAwMCBuDQowMDAwMDAzNzU5IDAw
MDAwIG4NCjAwMDAwMDM4ODQgMDAwMDAgbg0KMDAwMDAwMzkxNCAwMDAwMCBuDQowMDAwMDA0MDY3
IDAwMDAwIG4NCjAwMDAwMDQxNDEgMDAwMDAgbg0KMDAwMDAwNDM4NSAwMDAwMCBuDQowMDAwMDAw
MDE4IDY1NTM1IGYNCjAwMDAwMDAwMTkgNjU1MzUgZg0KMDAwMDAwMDAyMCA2NTUzNSBmDQowMDAw
MDAwMDIxIDY1NTM1IGYNCjAwMDAwMDAwMjIgNjU1MzUgZg0KMDAwMDAwMDAyMyA2NTUzNSBmDQow
MDAwMDAwMDI0IDY1NTM1IGYNCjAwMDAwMDAwMjUgNjU1MzUgZg0KMDAwMDAwMDAyNiA2NTUzNSBm
DQowMDAwMDAwMDI3IDY1NTM1IGYNCjAwMDAwMDAwMjggNjU1MzUgZg0KMDAwMDAwMDAyOSA2NTUz
NSBmDQowMDAwMDAwMDMwIDY1NTM1IGYNCjAwMDAwMDAwMzEgNjU1MzUgZg0KMDAwMDAwMDAzMiA2
NTUzNSBmDQowMDAwMDAwMDMzIDY1NTM1IGYNCjAwMDAwMDAwMzQgNjU1MzUgZg0KMDAwMDAwMDAz
NSA2NTUzNSBmDQowMDAwMDAwMDM2IDY1NTM1IGYNCjAwMDAwMDAwMzcgNjU1MzUgZg0KMDAwMDAw
MDAzOCA2NTUzNSBmDQowMDAwMDAwMDM5IDY1NTM1IGYNCjAwMDAwMDAwNDAgNjU1MzUgZg0KMDAw
MDAwMDA0MSA2NTUzNSBmDQowMDAwMDAwMDQyIDY1NTM1IGYNCjAwMDAwMDAwNDMgNjU1MzUgZg0K
MDAwMDAwMDA0NCA2NTUzNSBmDQowMDAwMDAwMDQ1IDY1NTM1IGYNCjAwMDAwMDAwNDYgNjU1MzUg
Zg0KMDAwMDAwMDA0NyA2NTUzNSBmDQowMDAwMDAwMDQ4IDY1NTM1IGYNCjAwMDAwMDAwNDkgNjU1
MzUgZg0KMDAwMDAwMDA1MCA2NTUzNSBmDQowMDAwMDAwMDUxIDY1NTM1IGYNCjAwMDAwMDAwNTIg
NjU1MzUgZg0KMDAwMDAwMDA1MyA2NTUzNSBmDQowMDAwMDAwMDU0IDY1NTM1IGYNCjAwMDAwMDAw
NTUgNjU1MzUgZg0KMDAwMDAwMDA1NiA2NTUzNSBmDQowMDAwMDAwMDU3IDY1NTM1IGYNCjAwMDAw
MDAwMDAgNjU1MzUgZg0KMDAwMDAwNTM3MyAwMDAwMCBuDQowMDAwMDA1NzYzIDAwMDAwIG4NCjAw
MDAwNDM2OTkgMDAwMDAgbg0KMDAwMDA0Mzk1MSAwMDAwMCBuDQowMDAwMDQ0MjE2IDAwMDAwIG4N
CjAwMDAwNDQ1MTMgMDAwMDAgbg0KMDAwMDA0NzY3MCAwMDAwMCBuDQowMDAwMDQ3NzE1IDAwMDAw
IG4NCnRyYWlsZXINCjw8L1NpemUgNjYvUm9vdCAxIDAgUi9JbmZvIDE2IDAgUi9JRFs8NzUyMzBE
QkZDMjVDQkQ0NUFFMTk3OUM5MTQwQTIyODQ+PDc1MjMwREJGQzI1Q0JENDVBRTE5NzlDOTE0MEEy
Mjg0Pl0gPj4NCnN0YXJ0eHJlZg0KNDgwOTENCiUlRU9GDQp4cmVmDQowIDANCnRyYWlsZXINCjw8
L1NpemUgNjYvUm9vdCAxIDAgUi9JbmZvIDE2IDAgUi9JRFs8NzUyMzBEQkZDMjVDQkQ0NUFFMTk3
OUM5MTQwQTIyODQ+PDc1MjMwREJGQzI1Q0JENDVBRTE5NzlDOTE0MEEyMjg0Pl0gL1ByZXYgNDgw
OTEvWFJlZlN0bSA0NzcxNT4+DQpzdGFydHhyZWYNCjQ5NTY4DQolJUVPRg==

--_004_TY0PR04MB635735F6211AD9C0D8748A0EE9869TY0PR04MB6357apcp_--
