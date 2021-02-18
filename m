Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5A31E6B9
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 08:13:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh5X13dY8z30NP
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 18:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=zPuPonHC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=6769880a0=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=zPuPonHC; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 18:12:50 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dh5Wk4XYNz30Kb
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 18:12:49 +1100 (AEDT)
IronPort-SDR: h7WkdgYr/xHvzMU7kzxA132hgfJmzmUC6ezevn0xjdQbXUO+yCzQSBJxiT1aiqW9HQNuauQoAn
 KJJ4Z0rfzS1w==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 18 Feb 2021 15:11:43 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 18 Feb
 2021 15:11:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.56)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Thu, 18 Feb 2021 15:11:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STm5OoViEiq4ku4zTpubWb3wQWqWBq84btHLO6AqumcNow+89M2XpTb2mMKWt/muHpxZ4Iub3VD9LCWaPR2I4+ZgB/ctsp+6fSP5OKaqAzlqR7VCpRoQDqW+0lKT3bJ+FCMM92s7GnoHb8rDpvEYgvKBLHFgSWdnuF2tKt5Yc2GaTrAfmwRs9Qwa+rMcgqLGmJrQOoj/7l+0tcs+f2ikW/W8p3J94K4poXTy7EAJklC4T2ZQFaqKbF36Moz6uiFZWwxTlsioskaPhZVcQsxdhhUIeFpOAP0EHcX9vseeJnfcfiODWidhmK3yMCh+ihY3MnezvfrAhTJvlnRi0UpGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Meqxqs4UFeDXkZfg8/QMWEPI602xB1E/75FgRJUaFD8=;
 b=Pto95cWBjGpnDXLVjjQDVvQAMEWEKWJNWPHq3HKIazPelSjg6kIHnb2IFTYpcw+6rUhWrGN9pc6LOXZpo3aNbW/xj4LwDBwLV8VtMd0mjPf4BTOS1g9HFNZGqQ70aBu/1gu8/EMOncEpOW9RfbQBlFnVStsdh34q67bLZqau/XhT52bU2hy5nK9Gite8U7iAOHVexIqzF6pmeXQjMH0nbzQtkF1qv+UMSWQhB5IrIphYkvw/kPazeOEC4xgk/SDwOj2LXPVZpJtsXbNMaD81RraIOVKol5vOxQia+VTip0inVYshJViytJGGk+ejvs5Xejc2nxTZPkEkxddmRWx77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Meqxqs4UFeDXkZfg8/QMWEPI602xB1E/75FgRJUaFD8=;
 b=zPuPonHCPb3TifRRGjxx0gUKRYyk/XfQoNp/bITqXj9pxuihVybWdN4V0nuuOLYsjuatlditIKwjwcV5F+O7kOIm3q2raBwqn2VfU9JD7VIUfpflCSjJfdKBVobsq1Er1Ngw76QegZ9UzrzM93gJ4NucCF4/BNpfQChr1NRdTNQ=
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com (2603:1096:203:5b::20)
 by HKAPR04MB3956.apcprd04.prod.outlook.com (2603:1096:203:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 07:11:40 +0000
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::69e8:9f69:4230:d8b4]) by HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::69e8:9f69:4230:d8b4%6]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 07:11:40 +0000
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ANSI Escape sequence unexpected output
Thread-Topic: ANSI Escape sequence unexpected output
Thread-Index: AdcFxEtS+fFreU74QjqE13t2aq5KQg==
Date: Thu, 18 Feb 2021 07:11:40 +0000
Message-ID: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1685854e-b626-44d8-30f8-08d8d3dc7086
x-ms-traffictypediagnostic: HKAPR04MB3956:
x-microsoft-antispam-prvs: <HKAPR04MB395690CDF111E4B7BCE48B4BC9859@HKAPR04MB3956.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bcOyiGMHZxNLfqMHk4t40Vp8AeBHf54xAFA5ho0P+dIYKz235EPgCXRal7zjadpt7R7eII/VxKjnkOdMpbG222mMycoP6Ylj2q6+RAJl9+bDrH9GW0lXFknxJpzjziGUFwbNUtaRz5ChsV0sfesLkVFbkKx2VTkg7DbIvU6z/86JbtG2co1Xl6zITSaCznx+LgFIs3+EAER4O4mDrpHYGjzF0C5FaE3VtpptD+EDsyUQjqaxmuaHUE/08GX9er5FKtftp5JEH8ulM2NrtoUJBnPi+FnZqjE/ux8PVo7shV9AVw+rxdg+Fbvhp+JVzXIVYV8fTCC0zaa4rd+zDztE1l9Y10pWKZjnrXtPDp+obKamgJuy5GtjWhJA5XZUwiWfrtF3gDCj9zf/NwRhWHpZZA3so68GRBXyws93J7ajl9affl8qcQw4I9b2e02jxkU9y87k/Wm0PJ39Xmmjw8TluVu7lHx7FXvvQo4s4DWuDjy2QH5IC5EbpZ+FEzGuYI2PVM+utF0ZzJ+1PqIQHUlpxDEWm/PS2/FnLwOqUyVP+QrNkofakQCiy3kwB9jC+bXwjOEimTxkI0kVX/XBjHsc2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2737.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(26005)(7696005)(186003)(86362001)(83380400001)(8936002)(4744005)(478600001)(85182001)(71200400001)(6916009)(52536014)(8676002)(5660300002)(966005)(15188155005)(2906002)(33656002)(16799955002)(6506007)(9686003)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(55016002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?Q1ZTT0V1djVOOUhWOHM1ZXFLdGlWZGJkQWIxUTN6V3VLREpBZHgyTUhtV21XNDJo?=
 =?big5?B?SGZTb01NU2MvUUhxTUUzOEQ2M2tWeTZlM2JEcHd2aldMTlYreDhaWTdzdzhtdkZ0?=
 =?big5?B?b0ZLdFNvUHJ5S1BabG5udXdJR0ZEaUlqMEdvT0x2Q2VTZlR1V2ZDWVIrclp4dDlw?=
 =?big5?B?TkgvUGlJZ1J2emdCejQ3MjNVMHB4YmdGNzVVQXpyZ2J0VlF4cFNDVU5ydDVUcGI0?=
 =?big5?B?Uy8vTU5BWlBBeWdUOHlIbGFpZlRMaWtlNkYvcTNEbm04SXByMU5ibkE3QXppV1l4?=
 =?big5?B?R1hvZFcyNGt0WGtvNzNiZ2xzODIwRlYvNUl2ZEVJbGhuaUpZMVFCd3grNWlUMDJN?=
 =?big5?B?K2RRQU9hSVlkNVRPU2lnb2QrYWtLeHlqQXEyem04dUNkMUdocjJucVQxVDZ2SDMy?=
 =?big5?B?ODROc1pYM0NqMEw2RmRBbm9JbXV1Tzk1MmtrZzZHZTQ0MGtoQUdOVnMyTUNGSVlp?=
 =?big5?B?azh1QmFXM1QrY0pldFhCU3Bkd0hWLyt0bUkxK1V6OVpzUWdodlZMSGlIeGJUN1Q5?=
 =?big5?B?cGV2ckQxS3RrcnBnZExqaURVSlp1c3grVDZlcnJJSkUvTzdlV29xbUNNdDZVR2lB?=
 =?big5?B?UDlkZ1hibm1nYW0zRktyeTRlSmg1RGY1d2Z1bTd5bmFCZXEydVppaVVVN2pqODFo?=
 =?big5?B?ZkdNKzh4MEMzL2NhdVFJQUxmWjBLYlVBbXNIdmhaN2xILy9IMmRUcHBpTGdac3Vh?=
 =?big5?B?Yml3dnFsemJmV3NaSis3bHI0V3V4bitCb2hUdjRPaFNBMjF6NEUyd1V5R1poekJm?=
 =?big5?B?WVdvazRHdlBpaS9zaHRyNUVEWUowNFZnOU42b1piQXFoWVM2M0M0WkxYcmdxZ0pr?=
 =?big5?B?ZUswNUZpV3hlbnZaUVFqdDRUdEExRGxrTVJFL1daajFyVkZRdXUxdG5qYmpnL25S?=
 =?big5?B?NWFWcFZkSEpma21EcXRHRkExNFVBbVBkeXk4aXBmYnZxaEcrYy9ZWndjSzN5R2NR?=
 =?big5?B?L1hPV3cxUG1HbWwvYjZseGcrY1NyV3dxQi9KUFBPTWUxQTQ0Z1V5Tm1PUXNiamVn?=
 =?big5?B?QjVlVlFndlRkdkxyUFNSYTYwSklsdytFTnZyME1iSjd4OGxRdEZiSlQ4dUhlZFpC?=
 =?big5?B?L0IxQW84UnR2Q0lNNk9RMWFrNm92Z2FZR1kzSGtHcnNRUDFkNm5sa3E5SFJDMGpV?=
 =?big5?B?aXdqYmNFamZ6N3lJamxjbzdXREE4WUtrRnBWd3pqSUQrd0U0NkhRaE1CcDYvSXB0?=
 =?big5?B?Q2kxUzZnV1UzcTRyaHJ5UnN6RFhydjllSDM4MXNZTjBWWEVteTRwZjZVUENQV0d2?=
 =?big5?B?eDVPK1NSUzg1V1lpdmlXc2U5MExSWUNLNTdVc1VnTHhmQ1ZIc3oxaUFCcXFRWEo1?=
 =?big5?B?UEVkaDExcldyRnBsMEZyaFgwdnpNbGxZOGRKYXMrellOcVM0M2lIcWhURG5UUzhE?=
 =?big5?B?elNpc2o0NnVqNkIzYVVuemIyc3Q2T0JVWW14ZCs3WWRLcjRnODdiSk9VVmRWZWxn?=
 =?big5?B?UkNHVFB4KzNMWmU0T3ZnR2dDSjkxbE9XMXo4c3UwVlYrN1hITDZtRlZHeWQxTW5E?=
 =?big5?B?Y2U1b3REVnh5aXNuT1RpMmZYbHFFamZLamdkbnlxS1BLSTAwN2FHOWtjRGxZa3dv?=
 =?big5?B?MGsvSkxZQ25CNzc2aG8zaWw3SGVmWjd4V2FnSUxkYkUrTVBnYmlrTXc3dG5vVnVW?=
 =?big5?Q?SS6R7y+ndhzl0xqoxjmztvrYHPc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2737.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1685854e-b626-44d8-30f8-08d8d3dc7086
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 07:11:40.5294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QhTm51NT0op5btTAe013pOjfZpJkJaLmsy/eAylnfSG1js2dKLxxbUWMkIerNOFK24bTkm2/jsVLW8WlL9R+VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3956
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgYWxsLA0KICAgIHdoZW4gSSB1c2UgdGhlIGhvc3QgY29uc29sZSB2aWEgdWFydCB0byBsb2cg
aW4gdG8gb3MsIHNvbWV0aW1lcyBzb21lIHVuZXhwZWN0ZWQgb3V0cHV0IGlzIHByaW50IHRvIHN0
ZG91dCwgc3VjaCBhczoNCg0KbG9naW46IHJvb3QNClBhc3N3b3JkOg0KTGFzdCBMb2dpbjogIFRo
dSAgIEphbiAgIDcgIDA2OjUyOjE4ICBVVEMgIDIwMjEgIG9uIHR0eVMwDQpyb290QGludGVsLWNv
cmVpNy02NDp+IyAgOzE1M1IgICAgIDwtLS0tLS0tICBUaGlzIGlzIHRoZSB1bmV4cGVjdGVkIG91
dHB1dA0KDQpJdCBhbHNvIGhhcHBlbiB3aGVuIHVzaW5nIG9ibWMtY29uc29sZS1jbGllbnQgb3Ig
aXBtaXRvb2wgc29sIGFjdGl2YXRlLg0KSXQgbG9va3MgbGlrZSBhbiBBTlNJIEVzY2FwZSBzZXF1
ZW5jZQ0KIkVzY0xpbmU7Q29sdW1uUglSZXNwb25zZTogY3Vyc29yIGlzIGF0IHYsaAlDUFIiDQpy
ZWY6IGh0dHA6Ly9hc2NpaS10YWJsZS5jb20vYW5zaS1lc2NhcGUtc2VxdWVuY2VzLXZ0LTEwMC5w
aHANCnJlZjogaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvMTYwMjY4NTgvcmVh
ZGluZy10aGUtZGV2aWNlLXN0YXR1cy1yZXBvcnQtYW5zaS1lc2NhcGUtc2VxdWVuY2UtcmVwbHkN
Cg0KTXkgcXVlc3Rpb24gaXMsDQpob3cgdG8gcHJldmVudCB0aGlzIGVzY2FwZSBzZXF1ZW5jZSBm
cm9tIHByaW50aW5nIHRvIHRoZSBzdGRvdXQ/DQpXaGljaCBwYWNrYWdlIGluIG9wZW5ibWMgaXMg
ZG9pbmcgdGhpcz8NCkhhcyBhbnlvbmUgaGFkIGEgc2ltaWxhciBwcm9ibGVtPw0KUGxlYXNlIGxl
YXZlIGFueSBjb21tZW50cy4NClRoYW5rcw0KDQpEYXZpZA0KDQo=
