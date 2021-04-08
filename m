Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB835857A
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 16:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGNGk4jdZz30Fb
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 00:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=XfARgHBO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.90; helo=mx01.quantatw.com;
 envelope-from=prvs=72590da93=alan_kuo@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=XfARgHBO; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Fri, 09 Apr 2021 00:01:17 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [220.128.79.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FGNGP0vv2z30Cm
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 00:01:15 +1000 (AEST)
IronPort-SDR: aQi3JBgvaLed2rO3Fnvi+wEqWkm3+Mpkdx88yfm8Z06TwL41VODJbxy3a5lMSOtaKBRZ5EcfV8
 M8v1oUU016Bw==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 08 Apr 2021 22:00:05 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Apr 2021
 22:00:07 +0800
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 8 Apr 2021 22:00:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjPo4il8+NU3fsOnjqSQlrHhRCKkjKA6OiIk8e12HbyduBER2wfcg2JuW7i7WBCFnjmuzQwXgOFReB/gNDOBkKigldN143f1d+9IWtYP6UNypkqVJWaYYLJ7YEuzAFS2P/PSXBfY685v8AURMtY7DNb5jyEq/z6HLoKdo+ORjlSOKst87QpAKlbmxnJFhqJ6ODfioTMe/lWnQHwI7OFJdgOSL4YBAK0+5nWVV+b40n4Z72e2xE3Kbm3GDrS9nVPt+IAw8MxSwNAcmL4YlKkaEL903LgrQWaVt4/f08hFiaDpT47/qOKLmY67IpKI4Gb3IqPZ0f3p6vrsUkr+mBFaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1D0tBHYh/HRJ0TKKtB+ZbhAGLfDPc1QnlRSO5eYzh8=;
 b=Koro7tE5ecW1rG7MNvN1t5nPoPzg5lKcLBVHV3PfkVrfQG4I9eoZAHAS3kJUCmJe1cAJgUX1+T7zpSjN19WZb++1iTsUXo1E1xATkOUhVSsY2oje4dW2F45wopHTDHU7wDi3FrDCxZcKbqlRZuCOtTgv1aI3Pwo58EJbt39RvvGz+9sP7wqUZA0lX+g/sfshVRQ2Cfcr4WW82ULoo2NOO6fzZzlqHm56QX0/9k25VDjhybV5d78YDLjRSRxVmyafeMPPMeTvo8h7dWoZzv/whlBSjdqTTSHmQKlDRdpQk4XLqMFhQqq+jXdBuTDd5+8SNjG4VPtjc5lN5pHECw8T5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1D0tBHYh/HRJ0TKKtB+ZbhAGLfDPc1QnlRSO5eYzh8=;
 b=XfARgHBOg3fTzkOGug3TXdzjwacURpvJoluvARcm71d7ofO11lE1iLCjcTj6o6Fs93k3/yy9Xzov7uA5QXnUL8SdRRDRf+DncKNH62be9XNcq/EmYXjyNZMmpBIHxNR3Nl0vXdo8uzM7WiWhmnEZDEFKMvkfT+7Fjq+bkjXGhI4=
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com (2603:1096:400:7::8) by
 TYAPR04MB2398.apcprd04.prod.outlook.com (2603:1096:404:20::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Thu, 8 Apr 2021 14:00:00 +0000
Received: from TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf]) by TYZPR04MB4239.apcprd04.prod.outlook.com
 ([fe80::cc44:7c91:98f0:ebdf%6]) with mapi id 15.20.4020.020; Thu, 8 Apr 2021
 14:00:00 +0000
From: =?big5?B?QWxhbiBLdW8gKLOirra6+yk=?= <Alan_Kuo@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [phosphor-virtual-sensor] get sensor service fail
Thread-Topic: [phosphor-virtual-sensor] get sensor service fail
Thread-Index: AdckeWMqNCOopUvCScqd11K5g4utAAH7shVw
Date: Thu, 8 Apr 2021 14:00:00 +0000
Message-ID: <TYZPR04MB4239076E95381F8E9E9E06FA84749@TYZPR04MB4239.apcprd04.prod.outlook.com>
References: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e3866db-083a-4735-9d26-08d8fa9699bc
x-ms-traffictypediagnostic: TYAPR04MB2398:
x-microsoft-antispam-prvs: <TYAPR04MB2398F61EC697F9F946CD477D84749@TYAPR04MB2398.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOgaHj+I8+W0/HZwqHOCbu7Ii0MLX6Pk5dhOtTFPFOT5QecHKUZs5fZG/nuZro4KY2JuLePHeQJto+cMDsoocHXmKsQY15PmnB5KLpLgercOQG9qN0L7r+FacUsh/z3mH+mEhBsq5k5xxnSMBfb2yyt7sysku3Bo0Wjnj/tLaV/BnnzpanS/fUkG21Z1EzZN2MqHNRkqrJsPofHuO8s7uLJwnsXr4n5FhniT1kV9kBst2JUmjv05h8bp2nD0iXjb4I7l6CWVzt9h+IU2YuPfVLxskXLB20Gk66iHIns+TANim20k1LaxFeNKWEPO0JiMVrtR/KXpQZACP0dp/UlEXdMNTiK/9h74YBHKSXOXYumg5xu6zibM4uQAg6eo2MF0/Ayl52JXLCYnugqvq0zWNtZv45MD7nIfxdJUaihZpA9Uv2coZOaOfBehY5k3hV5pmbHoksHrNr1Me4JYOaSrcNoSkxnJqpsR4BskzXKRRGtWGWqnpXeMgfVDMoPEmyZXiCLaUKWuP88jP8KsVJG1tiQpU73nc7Wgys+SL3TCmg/VmR3jlEi6Cm45emwB46eNfq4rRo5iSLbwFUzkMSY1M9EmG00uqaJ6PQZh0aiMmnuLeovtEmimlCbZNjPZqd273xCnKeRWKELsan+4iuzxkVbVn/J1Hbdq+zOY8pmVCOS2uyQLPV5Z27KGDJqdnjmNpCHwnLH9Yly163aU7wt4af2vhR4cJderR9Bbx6Orzow=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR04MB4239.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6506007)(316002)(33656002)(8936002)(5660300002)(478600001)(9686003)(6916009)(38100700001)(7696005)(2906002)(54906003)(83380400001)(166002)(86362001)(66946007)(64756008)(71200400001)(8676002)(53546011)(85182001)(66556008)(66446008)(66476007)(4326008)(52536014)(55016002)(186003)(76116006)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?YXRtR0hHZFZ1MzdwclhZRDBZSitucll5MFVjWXdFWVVqSWtkTDh3VHNpTmZ6WnUw?=
 =?big5?B?cGxIeHRoSjUzYWd5THpSV09YcXFTWFhHc2Z6OFY5K2U2a0tSaXU5cXFWNmlxY00y?=
 =?big5?B?VkZLdVd0V2l1T2I3cXBKU2hhNUdPVWlCTkpEZ1lCZS9Ga0I4MU5QL3JtRC9KbDk0?=
 =?big5?B?a3Nrdy8xL0s5clpPY05GNCtVdmxtYjFJVkFQRzF5V2NLVnl2TlB3RDVGYVVsdXZ4?=
 =?big5?B?ckFUUEpUVVMwdDhZS1dBSDFVZnlXeHNwV2JsMDV2VHcrcS9PcUpRT1JtdlV4aHlE?=
 =?big5?B?RW4vVDJQb3hLQW9wU1FLUjZPRW0zeGwxU0kzQVRTTlhuanJWUTVrSTkydngxMndu?=
 =?big5?B?eHRoc05JclBIZTRZOWwzQTBlc1gvaFZWYkVjRzVkWWlqaTRHTHVwQjF4TTJKcnFS?=
 =?big5?B?a2txVGU5eXhWOGJHTXd2aXF1dlNvZzlTWXpDMmt4cFdyelNDYlYyWmFNZjQrbUtY?=
 =?big5?B?emxzdzI2KzBOV2RzRGJYWWtSSXJleWJIZmV5OFNMcUV3Q0Z3Wk5yL2lHbmlrZ2Fz?=
 =?big5?B?bnlIVmJkbW1yL1VWRjdoRk9JZnVQVkdtSUVHU0dyUE92eEJFOFNUeUJpanpuR3dU?=
 =?big5?B?ZENrcGx2Z3hyeTlKbFFpbWdoT2lyb0RsZThNT0tTQ1BLY0wzODU4UFliMVd0SHE5?=
 =?big5?B?a1huakhFNXJKQUtjWlRsZlVUV096TCswVVdUM3FyckNOQlhnVEsxVVFNSFQzbmZE?=
 =?big5?B?UEtZdkQ4SUQ3eFBHQjBtQU5IcEsvb0Mvdlp3a05EUDhJRk9OZkN6ajdYTGZFdWFM?=
 =?big5?B?UVRvTFR4MVkxVjdhSkF3SlhPWDNSV1h2alNXKzRxb2lBQkJFaUhlemhQNXlFWFhm?=
 =?big5?B?QXFJb08vdm53RkFYUTVyRVVGK1A0bm9SOFBQWjFaZDBIUExpM00wcmpCeWVlL3RS?=
 =?big5?B?WmEwUzExaFFGK1d3OGFwU3pZdVlTdFpEUDdSaGZzUkVHdlRqaUxqTFNHRmU4cS9v?=
 =?big5?B?bEMzSENBblFrYy9JZ04vWVlOZ2hTdG9jR3dRNDBIVTBnUWlEbWZhYitNVWF2NFJD?=
 =?big5?B?SWpZdGVWNDhEZGdZbE9heERwSUw5SUlOQjR3ejJUTVl6bG1FdE9XUUh6MHlrT3NV?=
 =?big5?B?Uy9sODNrd1kwZTZ1UTdjdVhnbCtzRjQ2cUdicXVHR3JqQzhGeFFiTTRCQ3E1UFZr?=
 =?big5?B?ckJKT0sxL2o4VXM2RFA1ejh2cThPMCtWditrQUtDb3B2bms0cXlhMHpkK25sSkJL?=
 =?big5?B?Z1RKaVJ1cnErRlVnOGRRRTVRUkladlJOc29WZXdQOXRCUHQ5UDZ5dHlGRnEzdk45?=
 =?big5?B?cXlXNXNid2RrL3FjNlU5bndvUTNpSllid3d1YjRnZ2s3YXJCamJMY3NQRmpPU3hv?=
 =?big5?B?SXpYajExZTVvcExxYmVFcWR4NzJmS1RwYUl0bFQ4S0FkRnpFYjlQS2xVUVdDQnlF?=
 =?big5?B?S051VytRRzJERGt6ZUtGN21ZNW44aDREeWQrS1VyYVUyZEJMVXZqMlZvQjVGQ3Fx?=
 =?big5?B?UXBaL2tmeEw3K0lTOVE1WU5PaHdSZ0NKcGpnUVdzdkpnVHAzOUFBNUlBNllzK1Ft?=
 =?big5?B?UDArVy9UbC9DSENjbysxeWQ1QjJUZUZkNzhHaW1mNHRyMDdESEtPdnBQcHg5RDZm?=
 =?big5?B?dFErWEVKME5hNlB4N3M2R1NEVlJueE1saVlyc2Z5Zi9xblByWkdvV2hxNUNrOUhE?=
 =?big5?Q?QHVqdS5fGcjlJuXZkGhfGzUayNLvfbhnS3c6RnfzEsdHf/XL?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TYZPR04MB4239076E95381F8E9E9E06FA84749TYZPR04MB4239apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB4239.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3866db-083a-4735-9d26-08d8fa9699bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 14:00:00.3223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9Whxz6zFVrBljEbspN50xmqj8YXczl/0ugfTNm3fsHvx/v1jjMbpfJGVgl33aEYWAWsY003tBUNm/bD6pejBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2398
X-OriginatorOrg: quantatw.com
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
Cc: "edtanous@google.com" <edtanous@google.com>,
 "nanzhou@google.com" <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR04MB4239076E95381F8E9E9E06FA84749TYZPR04MB4239apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBibWN3ZWIgTG9nU2Vy
dmljZXMsIHRoZSB0aW1lIG9mIHRoZSAiQ3JlYXRlZCIgcHJvcGVydHkgaXMgdGhlIHRpbWUgd2hl
biB0aGUgZXZlbnQgaXMgZ2VuZXJhdGVkLCB3aGljaCBkb2VzIG5vdCBtYXRjaCB0aGUgZGVzY3Jp
cHRpb24gb2YgdGhlIHJlZGZpc2ggc2NoZW1hLiBUaGUgIkNyZWF0ZWQiIHByb3BlcnR5IG1lYW5z
IHRoZSBkYXRlIGFuZCB0aW1lIHdoZW4gdGhlIGxvZyBlbnRyeSB3YXMgY3JlYXRlZC4NCldlIHRo
aW5rIHRoYXQgdXNpbmcgoadFdmVudFRpbWVzdGFtcKGoIHdpbGwgYmUgbW9yZSBzdWl0YWJsZSB0
aGFuIKGnQ3JlYXRlZKGoIGluIExvZ1NlcnZpY2VzLg0KDQpDb3VsZCB5b3UgZ2l2ZSBtZSBzb21l
IHN1Z2dlc3Rpb24gPyBPciBhbSBJIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGRlZmluaXRpb24gb2Yg
c2NoZW1hPw0KDQpIZXJlIGlzIGFuIGV4YW1wbGU6DQp7DQogICAgICAiQG9kYXRhLmlkIjogIi9y
ZWRmaXNoL3YxL1N5c3RlbXMvc3lzdGVtL0xvZ1NlcnZpY2VzL1Bvc3RDb2Rlcy9FbnRyaWVzL0I1
LTgzIiwNCiAgICAgICJAb2RhdGEudHlwZSI6ICIjTG9nRW50cnkudjFfNF8wLkxvZ0VudHJ5IiwN
CiAgICAgICJDcmVhdGVkIjogIjE5NzAtMDEtMDFUMDA6MDE6NDMrMDA6MDAiLCAgICA8PSAgSXQg
c2hvdWxkIGJlIEV2ZW50VGltZXN0YW1wDQogICAgICAiRW50cnlUeXBlIjogIkV2ZW50IiwNCiAg
ICAgICJJZCI6ICJCNS04MyIsDQogICAgICAiTWVzc2FnZSI6ICJCb290IENvdW50OiAxOiBUUyBP
ZmZzZXQ6IDY1LjQ3Njk7IFBPU1QgQ29kZTogMHgwMSIsDQogICAgICAiTWVzc2FnZUFyZ3MiOiBb
DQogICAgICAgICIxIiwNCiAgICAgICAgIjY1LjQ3NjkiLA0KICAgICAgICAiMHgwMSINCiAgICAg
IF0sDQogICAgICAiTWVzc2FnZUlkIjogIk9wZW5CTUMuMC4xLkJJT1NQT1NUQ29kZSIsDQogICAg
ICAiTmFtZSI6ICJQT1NUIENvZGUgTG9nIEVudHJ5IiwNCiAgICAgICJTZXZlcml0eSI6ICJPSyIN
Cn0NCg0KVGhhbmtzLA0KQWxhbg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrYWxh
bl9rdW89cXVhbnRhdHcuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBIYXJ2ZXkg
V3UgKKdksVK6+ykNClNlbnQ6IE1vbmRheSwgTWFyY2ggMjksIDIwMjEgNToxNCBQTQ0KVG86IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6IER1a2UgRHUgKKf5sru5xSkgPER1a2UuRHVAcXVh
bnRhdHcuY29tPjsgRnJhbiBIc3UgKK59u3jBvikgPEZyYW4uSHN1QHF1YW50YXR3LmNvbT47IEdl
b3JnZSBIdW5nICiseKm+t3EpIDxHZW9yZ2UuSHVuZ0BxdWFudGF0dy5jb20+DQpTdWJqZWN0OiBb
cGhvc3Bob3ItdmlydHVhbC1zZW5zb3JdIGdldCBzZW5zb3Igc2VydmljZSBmYWlsDQoNCkhpIEFs
bCwNCg0KICAgICAgICBJbiBjdXJyZW50IHBob3NwaG9yLXZpcnR1YWwtc2Vuc29yLCB0aGUgZnVu
Y3Rpb24gZ2V0U2VydmljZSB3aWxsIHJldHVybiBlbXB0eSBzdHJpbmcgb25seSB3aGVuIGNhdGNo
IGVycm9yIG5hbWUgPSChp3h5ei5vcGVuYm1jX3Byb2plY3QuQ29tbW9uLkVycm9yLlJlc291cmNl
Tm90Rm91bmShqCAoaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItdmlydHVhbC1z
ZW5zb3IvYmxvYi9tYXN0ZXIvZGJ1c1V0aWxzLmhwcCNMMzc8aHR0cHM6Ly9hcGMwMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUy
Rm9wZW5ibWMlMkZwaG9zcGhvci12aXJ0dWFsLXNlbnNvciUyRmJsb2IlMkZtYXN0ZXIlMkZkYnVz
VXRpbHMuaHBwJTIzTDM3JmRhdGE9MDQlN0MwMSU3Q0FsYW5fS3VvJTQwcXVhbnRhdHcuY29tJTdD
Y2RlMWVjYjdiNGZlNDY4MzJhOTYwOGQ4ZjI5MzJhZDQlN0MxNzliMDMyNzA3ZmM0OTczYWM3Mzhk
ZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NTI2MDYxMjE1MzEwODEzJTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
d2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmc2RhdGE9NUolMkZVcjViWnZMRnIlMkZyRk9paCUyQmg4
UXVmSG95OHdjWG1Fbjh5VTZLJTJGY09NJTNEJnJlc2VydmVkPTA+KS4NCiAgICAgICAgQnV0IGlu
IG15IHN5c3RlbSwgd2hlbiBidXMgY2FsbCBkaWRuoaZ0IGdldCBzZW5zb3Igc2VydmljZSwgdGhl
IGV4Y2VwdGlvbiBuYW1lIHdpbGwgYmUgoadvcmcuZnJlZWRlc2t0b3AuREJ1cy5FcnJvci5GaWxl
Tm90Rm91bmShqCwgYW5kIHRoZW4gc2VydmljZSB3aWxsIGJlIGdldCBmYWlsZWQuDQogICAgICAg
IEl0IHNlZW1zIG5lZWQgdG8gbW9kaWZpZWQgdGhlIG9yaWdpbiBjb25kaXRpb24gb3IgYWRkIGFu
b3RoZXIgZWxzZWlmIGNvbmRpdGlvbi4gRG8gSSBtaXN1bmRlcnN0YW5kIHNvbWV0aGluZz8NCg0K
DQpUaGFua3MuDQoNCkhhcnZleSBXdQ0KRW1haWw6IEhhcnZleS5XdUBxdWFudGF0dy5jb208bWFp
bHRvOkhhcnZleS5XdUBxdWFudGF0dy5jb20+DQpFeHQ6IDE3NDA4DQoNCg==

--_000_TYZPR04MB4239076E95381F8E9E9E06FA84749TYZPR04MB4239apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"=B7s=B2=D3=A9=FA=C5=E9",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In the current implementation o=
f bmcweb LogServices, the time of the &quot;Created&quot; property is the t=
ime when the event is generated, which does not match the description of th=
e redfish schema. The &quot;Created&quot; property means
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Hel=
vetica&quot;,sans-serif;color:#222222;background:white">the date and time w=
hen the log entry was created.</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We think that using =A1=A7Event=
Timestamp=A1=A8 will be more suitable than =A1=A7Created=A1=A8 in LogServic=
es.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you give me some suggesti=
on ? Or am I misunderstanding the definition of schema?<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here is an example:<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;@odata.id&quot;: &quot;/redfish/v1/Systems/system/LogServices/PostCod=
es/Entries/B5-83&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;@odata.type&quot;: &quot;#LogEntry.v1_4_0.LogEntry&quot;,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<span style=3D"color:red">&quot;Created&quot;: </span>
&quot;1970-01-01T00:01:43+00:00&quot;,&nbsp;&nbsp;&nbsp; &lt;=3D&nbsp; It s=
hould be EventTimestamp<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;EntryType&quot;: &quot;Event&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;Id&quot;: &quot;B5-83&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;Message&quot;: &quot;Boot Count: 1: TS Offset: 65.4769; POST Code: 0x=
01&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;MessageArgs&quot;: [<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;1&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;65.4769&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;0x01&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
],<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;MessageId&quot;: &quot;OpenBMC.0.1.BIOSPOSTCode&quot;,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;Name&quot;: &quot;POST Code Log Entry&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;Severity&quot;: &quot;OK&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> openbmc &lt=
;openbmc-bounces+alan_kuo=3Dquantatw.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Harvey Wu (</span><span style=3D"font-size:11.0pt;font-=
family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=A7d=B1R=BA=FB</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt">)<br>
<b>Sent:</b> Monday, March 29, 2021 5:14 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Cc:</b> Duke Du (</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=A7=F9=B2=BB=B9=C5</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt">) &lt;Duke.Du@quantatw.com&gt;; Fran =
Hsu (</span><span style=3D"font-size:11.0pt;font-family:&quot;=B7s=B2=D3=A9=
=FA=C5=E9&quot;,serif">=AE}=BBx=C1=BE</span><span lang=3D"EN-US" style=3D"f=
ont-size:11.0pt">)
 &lt;Fran.Hsu@quantatw.com&gt;; George Hung (</span><span style=3D"font-siz=
e:11.0pt;font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,serif">=ACx=A9=BE=
=B7q</span><span lang=3D"EN-US" style=3D"font-size:11.0pt">) &lt;George.Hun=
g@quantatw.com&gt;<br>
<b>Subject:</b> [phosphor-virtual-sensor] get sensor service fail<o:p></o:p=
></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; In current phosphor-virtual-sensor, the function getService wil=
l return empty string only when catch error name =3D =A1=A7xyz.openbmc_proj=
ect.Common.Error.ResourceNotFound=A1=A8 (<a href=3D"https://apc01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fphospho=
r-virtual-sensor%2Fblob%2Fmaster%2FdbusUtils.hpp%23L37&amp;data=3D04%7C01%7=
CAlan_Kuo%40quantatw.com%7Ccde1ecb7b4fe46832a9608d8f2932ad4%7C179b032707fc4=
973ac738de7313561b2%7C1%7C0%7C637526061215310813%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D5J%2FUr5bZvLFr%2FrFOih%2Bh8QufHoy8wcXmEn8yU6K%2FcOM%3D&amp;reserve=
d=3D0">https://github.com/openbmc/phosphor-virtual-sensor/blob/master/dbusU=
tils.hpp#L37</a>).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; But in my system, when bus call didn=A1=A6t get sensor service,=
 the exception name will be =A1=A7org.freedesktop.DBus.Error.FileNotFound=
=A1=A8, and then service will be get failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; It seems need to modified the origin condition or add another e=
lseif condition. Do I misunderstand something?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harvey Wu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Email: <a href=3D"mailto:Harvey=
.Wu@quantatw.com">
Harvey.Wu@quantatw.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ext: 17408<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYZPR04MB4239076E95381F8E9E9E06FA84749TYZPR04MB4239apcp_--
