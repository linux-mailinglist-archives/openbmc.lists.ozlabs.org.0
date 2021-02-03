Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403E30D3FF
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 08:23:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVtSv5NLnzDwth
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 18:23:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=661d9a4c6=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Ohd5TD4n; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DVtSB1vXRzDwnb
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 18:22:45 +1100 (AEDT)
IronPort-SDR: aPESCboXyI6+OBYtqka9YJ2dTINJiUBzgUkR8e9MLKPw170wou/+fvvXMrPsPSZli6YejOICa0
 +dGGI8QVyRmQ==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 03 Feb 2021 15:22:42 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 3 Feb 2021
 15:22:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.59)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 3 Feb 2021 15:22:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxn6wN4exIFenfqR2KWhFZ3QiBTIZ5K41ek5EXIrA6rn8CM8g2H+/GKD2V4zWnenBu9keGtrWrOv24cosf8sHu/aquZfbIcCmSzWPcMb3vMUXU45CA3abBi9lgEaZtI56Nss5cDFQKgffAIppF2j5/ULZ1qHYLDW+4qSaN44vZUihroJSGhrA7ZtlzvAEGVKp7R+Qfa3Ps9mwGnBuQcOvgFkXovanbK53NFrNLMppcmKnSwSCN7aCh03SzetSF6y5Ccm2s0KAbd6O2O9T7I9V1BWEBhzHAKAD3g7fmKjyCB/p2vjZgW9TrNfNWNhMYyWntR2Hw1CfTcDG97edCplNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=813l639fEJpfUaPod4iSKhMegVqcn4YXYI5bH3UJVzc=;
 b=H2zT3C3nA0sWdKhEcRDXUSFig/17xQwt2XD86cq1yqBa2BUURoDpIY7mkFE56McQhTTCL1xAdbDWq66qvTyqRs4C6+3CejaQq0pBs56SiDD0XAFb4JaRiNd95Iso16lNninUckkSOS7gZkDs2Ck7lH3QYI9u1/9zQ2YITT632GYyR/8p9qKI07cdR2zPFPhtMbym6OYmZ4MWZT7LqNJNXso6QzrC8pELjGYPp6TJezRkD1JTYfuW83+oYFeO5NQo3rDewEfAi22cNG/hHRyHMAyuvogOpgh3ld9E3dNEscDfGa+gQlSrDS8JGY1fc6+VhQ6vIw4Ju5fFTju0Uto/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=813l639fEJpfUaPod4iSKhMegVqcn4YXYI5bH3UJVzc=;
 b=Ohd5TD4n67+4pbCIX1AbPFmyZsvaSGVtMrhlwb08yU0TjGah6bOdKrBTv237m7sgqLaCsZebEv8CgZ5KUWcmRKpEMvoFyO2XJXrf9aDlv/Y+rAb8QnalL9PMz6M9fFaypcUmjcrUQLSn4ITT29c/9k3gUAcY3Nq1t9ZQ1h5lVm8=
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com (2603:1096:203:67::10)
 by HKAPR04MB4066.apcprd04.prod.outlook.com (2603:1096:203:d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Wed, 3 Feb
 2021 07:22:40 +0000
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51]) by HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51%7]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 07:22:40 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: [entity-manager] Issue about entity-manager getting stuck
Thread-Topic: [entity-manager] Issue about entity-manager getting stuck
Thread-Index: Adb0diyKK8cE9nwESFKTsQMV9K5OLgAWJ+gAAUs4ZxA=
Date: Wed, 3 Feb 2021 07:22:40 +0000
Message-ID: <HK0PR04MB2564A9FFB0B2C5116BC409C286B49@HK0PR04MB2564.apcprd04.prod.outlook.com>
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
In-Reply-To: <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47328fad-f67f-4b59-df62-08d8c8147dcf
x-ms-traffictypediagnostic: HKAPR04MB4066:
x-microsoft-antispam-prvs: <HKAPR04MB40665A17102EE7B282E7F51186B49@HKAPR04MB4066.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6BLTCPPpEl9kuPaYHIHLP9irQHtJqAHa0QTP2SwpbnK4KeiZjPB8j8j57f7r038XsjtmRZ4YEW1xEr0ZjUm453BcjlT6qjrEV1K8y8j9IwPttHv9WhOG/2uvBqX96N8WcQvhsPjMpH1CC+iaZmuA5W0Q15wUCiFP2Hsia3imz6FbZqSuJ0AlYAbsxgFA+yqLunDxTdDHs7oNc6WM9wcJSSWKyGnRPII7S0nldz3i1J0Y2EFJJ+TcOIIPaLsLdc+cctNltD/Pg7+R7M5XyomP+AWzzyjWkJ9OmV5yUo4qJWiF4llg1ajeNFhIVyYFT3uGR6rBUYsI40uHdbH32CKfhc+EtuiH5iNFM7Ba+6TrsfWOR3LdPcMgHLM5XrmTcm6HiboDc4LPr0EVXvW7X3HVpMrihDminPdTVdASMj/dJCntdurpfaxiswTL/IpXdq394dcHQuQvGpz+6RMXWKOqr1ho65CbmCRBDaeduhMThMO4aHgaTgqHiHaJyBvkHAqfSYfZoiug28M+dVSvxfQltfJC7Q3B1+g9oVn7PpIG3G/h1RF7i5m9y11Q954FY2RTT6QvtOsSdyVJBVw7W7h/6nf1gnCurjjtCqBM3I+rPJs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2564.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(2906002)(86362001)(85182001)(8676002)(26005)(966005)(5660300002)(186003)(52536014)(64756008)(66556008)(66946007)(76116006)(478600001)(7696005)(66476007)(45080400002)(66446008)(55016002)(9686003)(6506007)(6916009)(316002)(53546011)(33656002)(8936002)(4326008)(71200400001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?d2RhL05JWjZsMkZKMnlUTE5TTWlYY1pEWWd4U1FyQmpvaXVQM1RhYW95aFVPN0xy?=
 =?big5?B?RE1KWVh1WmxIZWdJQ0owQjVDUDhOc0VLVDdrWHVFT3U4NHlEYmtwUmY3akV3dkQr?=
 =?big5?B?T0tPbm9GQXgwRkJ1S3ZaeDd1T0dKZlFXUk1xTGo2Q0txQzRvVXZxUkY0NVlCcjRa?=
 =?big5?B?UWhVK1BFR3lpeEpKRW1iVmVWa3A0UTJMeGtpRkUrZ2V3YmZuNkY1NzB4Q29BUUxU?=
 =?big5?B?enF2N1pFUnM1Q3dFc3o4VmpEWTllYjN4WElMRTROdElwQ3MveC96R203ckJET0ZW?=
 =?big5?B?Y0VDTlZBMjdlVWFRcjE5QXU4ZjNIVERXYW9sV1ZsWlFvQTlLdjFucUczbWpVbGxR?=
 =?big5?B?WUhQQjY3aEtNMlhBcEFJTFAwRXU0cjY5KzZYZ25jT0Z6NndmbjRyeG5NdzBhWlJL?=
 =?big5?B?TSs1RzluaHdTajJvNFloYzJINmZoTWt3Mk1YbForbmZjZUNUNUs4Z2VlV2Zyak5K?=
 =?big5?B?b3ZCTDZQRzUxNEw3bGVHb0JTeDQ3dDNQQkQ5eTVSSURaZHZXY3ZRZ1RYOHl4RUdG?=
 =?big5?B?Um9TR1d0ZXduVWJUdlFEQ1NQaUlwMmRTMWxhYjRQOWZseHVMQzBCbEMySGtDZ0xz?=
 =?big5?B?TisyZDhPakdPRUc4YkhhZUl1aEtUL3dzdFNXeDg5V3pzNnJQbEdaWmxkellZWWxJ?=
 =?big5?B?NklaTks1c1VqbWxPWUNwNDMzMlpaWGM1R21USEhpbjVoSFlPdlhtcXY0WDJxRnkx?=
 =?big5?B?b0cyVXozb0pIWktLd3Z6bmlrN2gzSmhJQmcraThJY1ZmSitJblRvZTBXS2E2NWox?=
 =?big5?B?bjFGK0VpL1NVbjFSalRydlk4TVp5Z2lycjFFWmVQR0lVTGppSU0xbjNDTlVQU1pn?=
 =?big5?B?Mit3OVd5T2o3WVBndElmM3RZVWlqeGxhaS9rTTV4QVdGb0dxTW82M0x1Y09YTmlB?=
 =?big5?B?QkY5MHAxTk9NVUpyK1Rxb1VZNXp6VUVuejEyaUFDS2MwRlcxY3dUVmw2ZmlDMmJR?=
 =?big5?B?SGtYSUVKNzN0ZEZndkVIVDNSNW40RHkvcGZiSFVvT1NlUlUyQitOd0RMNFFlUjhr?=
 =?big5?B?bEVXb3lsSm84T2FuenBiVTBMV0QzUDgwejhtZmdsR1dFOHNHSVoxN3RVemhaTnND?=
 =?big5?B?WHRVcGZiYmMxTFg5R3B5bTZQeS9aR1VZSzZnS1BQa20yN29mcEtrSUQ4SVA0T293?=
 =?big5?B?T0hPN1dRV21ITXFXSVNlVmZ6cWFvdzVWREtTSnVGemJ1TmFVS3ZMVnV3UDRJMGJ3?=
 =?big5?B?Q3AvUnc2QkZsZVpSMndzTktKdHJkMTlLL2lib2FMc2pVVHBsanM4TlBHLysvRTRz?=
 =?big5?B?UU8xdTE5dnNDUE5WQ0ZKaTgrc3ZuSU53MjFIS1UwTzdYTXMzS0hDL1JUd3dEeXdJ?=
 =?big5?B?WUJPVkJpbFYwL1A0TWtyNnAzVUN3VGRxSThJdTBWLzN2TDZnTit3UlZYTXJrQzQ1?=
 =?big5?B?amZEMlV5UDM3ZVo2a1cyWUdyNHIrS3hjR0JLcm1SOE9zQi9paGkrenVpVFdsZDh3?=
 =?big5?B?M2JNN1h4ekxweU45aFN4WFVEL0VYenlGUWMzd3k5ZGpXeGdHYk1hQTByVzRneHFP?=
 =?big5?B?Rmw0dkRGSWpneHZJOEF2R2JNSkpZMVBxTWY5R0NEcW5pcmxWWjVpTmdUcXgvMDdU?=
 =?big5?B?dGpGOGJTYkk3UHJXbGVxQ21IYURzbkVDSStONWVERFpZcHNMV25JTC8xZllhY3Y0?=
 =?big5?Q?ZfIYfyO3TwsCi0nINx3INr0txomLuuInzCKhsg+d3OKfJnyP?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2564.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47328fad-f67f-4b59-df62-08d8c8147dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 07:22:40.7482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cn+wjq+MK9mobjcDAHoQlYF2hSHhZt5Vg7E96HE3o0FwZXnst1e6iymyDCgvzRIwGnvOoZNMinFGd3OgvM9YQA622fJVj+fOaitR3I1qnIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB4066
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRWQsDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCkluIG15IGNhc2UsIEkgaGF2ZSBhIHNj
cmlwdCB1c2luZyB0aGUgZm9sbG93aW5nIGNvbW1hbmQgdG8gY2hlY2sgdGhlIGhvc3Qgc3RhdHVz
IGFuZCB0aGVuIHJlc2V0dGluZyB0aGUgcGVjaSBtb2R1bGUgYmFzZWQgb24gaXRzIHJlc3VsdC4N
CmJ1c2N0bCBnZXQtcHJvcGVydHkgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5DaGFzc2lzIC94
eXovb3BlbmJtY19wcm9qZWN0L3N0YXRlL29zIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuT3Bl
cmF0aW5nU3lzdGVtLlN0YXR1cyBPcGVyYXRpbmdTeXN0ZW1TdGF0ZQ0KDQpOb3cgSSB1bmRlcnN0
b29kIHRoZSByZWFzb24gd2h5IGVudGl0eS1tYW5hZ2VyIGNhdGNoIHRoZSBuYW1lT3duZXJDaGFu
Z2VkIHNpZ25hbC4NCkhvd2V2ZXIsIHBsZWFzZSBhbGxvdyBtZSB0byBkaXNjdXNzIG9uZSBxdWVz
dGlvbiBmdXJ0aGVybW9yZS4gSG93IGRvZXMgZW50aXR5LW1hbmFnZXIgZGVmaW5lIHRoZSB3YWl0
aW5nIHRpbWUgZm9yIHRoZSBzeXN0ZW0gdG8gYmVjb21lIHJlYWR5PyBBY2NvcmRpbmcgdG8gdGhl
IHNvdXJjZSBjb2RlLCB0aGUgY3VycmVudCB3YWl0aW5nIHRpbWUgaXMgNSBzZWNvbmRzLg0KKFBs
ZWFzZSByZWZlciB0byB0aGlzIGxpbmU6DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRp
dHktbWFuYWdlci9ibG9iL2YwOTQxMjVjZDNiZGJjODczN2RjODAzNWE2ZTlhYzI1MmY2ZTg4NDAv
c3JjL0VudGl0eU1hbmFnZXIuY3BwI0wxNjg3KQ0KDQpJZiB0aGUgd2FpdGluZyB0aW1lIGNhbiBj
aGFuZ2UgdG8gMSBzZWNvbmQsIHRoZSBlbnRpdHktbWFuYWdlcidzIHJlc3BvbnNlIGNhbiBiZWNv
bWUgZmFzdGVyIGFuZCBiYXJlbHkgZ2V0IHN0dWNrLiBJIGZvdW5kIGVudGl0eS1tYW5hZ2VyIGRp
ZCB1c2UgMSBzZWNvbmQgYmVmb3JlIHRoaXMgUFIuDQooUGxlYXNlIHJlZmVyIHRvIHRoaXMgUFI6
DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9lbnRpdHktbWFu
YWdlci8rLzI1MTkzKQ0KDQpJbiB0aGlzIFBSLCB0aGVyZSBpcyBub3QgbXVjaCBjb21tZW50LiBN
YXkgSSBhc2sgdGhlIHJlYXNvbiBmb3IgY2hhbmdpbmcgdGhlIHdhaXRpbmcgdGltZT8gQW5kIHdo
YXQgc2hvdWxkIGJlIGNvbmNlcm5lZCBpZiBlbnRpdHktbWFuYWdlciB1c2VzIHRoZSBzaG9ydGVy
IHdhaXRpbmcgdGltZT8NCg0KU2Nyb24gQ2hhbmcNCkUtTWFpbCAgU2Nyb24uQ2hhbmdAcXVhbnRh
dHcuY29tDQpFeHQuICAgIDExOTM2DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEVkIFRhbm91cyA8ZWR0YW5vdXNAZ29vZ2xlLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgSmFu
dWFyeSAyOCwgMjAyMSAxOjA3IEFNDQpUbzogU2Nyb24gQ2hhbmcgKLFppfKptSkgPFNjcm9uLkNo
YW5nQHF1YW50YXR3LmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6
IFJlOiBbZW50aXR5LW1hbmFnZXJdIElzc3VlIGFib3V0IGVudGl0eS1tYW5hZ2VyIGdldHRpbmcg
c3R1Y2sNCg0KT24gVHVlLCBKYW4gMjYsIDIwMjEgYXQgMTA6MzQgUE0gU2Nyb24gQ2hhbmcgKLFp
pfKptSkNCjxTY3Jvbi5DaGFuZ0BxdWFudGF0dy5jb20+IHdyb3RlOg0KPg0KPiBIaSBhbGwsDQo+
DQo+IEkgYW0gdXNpbmcgb3BlbmJtYy9lbnRpdHktbWFuYWdlciBpbiB0aGlzIHZlcnNpb246ICJm
MDk0MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmU5YWMyNTJmNmU4ODQwIiBhbmQgSSBmb3VuZCBjYWxs
aW5nIERidXMgbWFrZXMgZW50aXR5LW1hbmFnZXIgZ2V0IHN0dWNrLg0KPg0KPiBSZXByb2R1Y2Ug
dGhpcyBieSBmb2xsb3dpbmcgc3RlcHM6DQo+IDEuIHN5c3RlbWN0bCBzdG9wIHh5ei5vcGVuYm1j
X3Byb2plY3QuRW50aXR5TWFuYWdlciAyLiBvcGVuIGFub3RoZXIgDQo+IHRlcm1pbmFsIGFuZCBk
byB0aGlzIHdoaWxlLWxvb3A6ICJ3aGlsZSB0cnVlOyBkbyBidXNjdGwgOyBzbGVlcCAxOyBkb25l
Ig0KPiAzLiBzeXN0ZW1jdGwgc3RhcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5FbnRpdHlNYW5hZ2Vy
IEkgdGhpbmsgdGhlIHJvb3QgDQo+IGNhdXNlIGlzIHRoaXMgZnVuY3Rpb246ICJuYW1lT3duZXJD
aGFuZ2VkTWF0Y2guIiAoUGxlYXNlIHJlZmVyIHRvIHRoaXMgDQo+IGxpbmU6IA0KPiBodHRwczov
L2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZnaXRoDQo+IHViLmNvbSUyRm9wZW5ibWMlMkZlbnRpdHktbWFuYWdlciUyRmJsb2IlMkZmMDk0
MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmUNCj4gOWFjMjUyZjZlODg0MCUyRnNyYyUyRkVudGl0eU1h
bmFnZXIuY3BwJTIzTDE4NTkmYW1wO2RhdGE9MDQlN0MwMSU3Q1Njcg0KPiBvbi5DaGFuZyU0MHF1
YW50YXR3LmNvbSU3QzMxYjQ2YzBjMDQxYjQwMmRjM2Q2MDhkOGMyZTVmOWRkJTdDMTc5YjAzMjcw
DQo+IDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc0NzM2NDAyOTk2NTI3NzAl
N0NVbmtub3duJTdDVFdGcGINCj4gR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMA0KPiAlM0QlN0MxMDAwJmFtcDtzZGF0
YT1WY0JSUjUlMkJURyUyRkZzY0hSMTRic0RNcWdoRTczcVJoR1loenRFMjVGS0l6RSUzDQo+IEQm
YW1wO3Jlc2VydmVkPTAuKQ0KDQpNeSBmaXJzdCB0aG91Z2h0IGlzOiBEb24ndCBydW4gYW4gZW1w
dHkgYnVzY3RsIGluIGEgbG9vcCB0aGVuLCBidXQgSSdtIGd1ZXNzaW5nIHRoYXQncyBub3Qgd2hh
dCB5b3UncmUgcmVhbGx5IHRyeWluZyB0byBkby4gIElmIHdlIGhhZCBtb3JlIGlkZWFzIGFib3V0
IHdoYXQgeW91IHdlcmUgcmVhbGx5IGhvcGluZyB0byBhY2NvbXBsaXNoLCB3ZSBtaWdodCBoYXZl
IHNvbWUgYmV0dGVyIGFkdmljZSBmb3IgaG93IHRvIHByb2NlZWQuDQoNClRoZSBpbnRlbnQgb2Yg
dGhhdCBjb2RlIGlzIHRvIHJlY29uZmlndXJlIGVudGl0eS1tYW5hZ2VyIHdoZW4gaW50ZXJmYWNl
cyBhcmUgY2hhbmdlZCwgc28gaWYgeW91J3JlIGNvbnN0YW50bHkgYXR0YWNoaW5nIGFuZCBkZXRh
Y2hpbmcgdG8gZGJ1cywgZW50aXR5LW1hbmFnZXIgKGFuZCBvYmplY3QgbWFuYWdlcikgbmV2ZXIg
c2VlcyB0aGUgc3lzdGVtIGFzICJ1cCIgYW5kIGtlZXBzIHdhaXRpbmcgZm9yIHRoZSBzeXN0ZW0g
dG8gZmluaXNoIHN0YWJpbGl6aW5nIGJlZm9yZSBpdCBydW5zIHRoZSBjb25maWcgbG9naWMuDQoN
CkluIHlvdXIgc3BlY2lmaWMgY2FzZSBhYm92ZSwgdGhlIGNvZGUgY291bGQgYmUgYSBsaXR0bGUg
c21hcnRlciwgYW5kIGlnbm9yZSB1bmlxdWUgbmFtZXMgaW4gdGhhdCBjaGVjaywgb25seSBjYXJp
bmcgYWJvdXQgbmV3bHktZGVmaW5lZCB3ZWxsIGtub3duIG5hbWVzLCBidXQgd2l0aG91dCBrbm93
aW5nIHlvdXIgcmVhbCB1c2UgY2FzZSwgaXQncyBoYXJkIHRvIGtub3cgaWYgdGhhdCB3b3VsZCBo
ZWxwLg0KDQo+DQo+IE1hbnVhbGx5IGNhbGxpbmcgRGJ1cyBvciBjYWxsaW5nIERidXMgaW4gYSBz
Y3JpcHQgbWFrZXMgTmFtZU93bmVyQ2hhbmdlZCBzaWduYWwgYW5kIHRodXMgdHJpZ2dlcnMgdGhl
IGZ1bmN0aW9uOiAicHJvcGVydGllc0NoYW5nZWRDYWxsYmFjayIgcmVwZWF0ZWRseS4gTWVhbndo
aWxlLCB0aGUgYXN5bmNfd2FpdCBpbiBwcm9wZXJ0aWVzQ2hhbmdlZENhbGxiYWNrIGdldHMgcmV0
dXJuZWQgYmVjYXVzZSBvZiB0aGUgb3BlcmF0aW9uX2Fib3J0ZWQuDQoNClBlcnNvbmFsIG9waW5p
b246IERvbid0IGNhbGwgYnVzY3RsIGNvbnRpbnVvdXNseSBpbiBhIHNjcmlwdC4gIEl0J3MgaW5l
ZmZpY2llbnQsIGFuZCBjYXVzZXMgcHJvYmxlbXMgbGlrZSB0aGlzLg0KDQo+IFNvIGhlcmUgaXMg
dGhlIGNvbmNsdXNpb246DQo+IE1hbnVhbGx5IGNhbGxpbmcgRGJ1cyBpbiBhIHBlcmlvZCB0aGF0
IGlzIGxlc3MgdGhhbiA1IHNlY29uZHMgbGVhZHMgZW50aXR5LW1hbmFnZXIga2VlcGluZyB0byB0
cmlnZ2VyIG5ldyBhc3luY193YWl0IGFuZCBhYm9ydCB0aGUgb2xkIG9uZS4gSG93ZXZlciwgdGhl
IGFzeW5jX3dhaXQgbmV2ZXIgZ2V0cyBkb25lLg0KPg0KPiBJcyB0aGlzIGEgYnVnIG9mIGVudGl0
eS1tYW5hZ2VyLCBvciBJIGdldCBzb21ldGhpbmcgd3JvbmcuIFBsZWFzZSBoZWxwIG1lIHdpdGgg
dGhpcy4NCg0KSU1PLCBlbnRpdHktbWFuYWdlciBpcyB3b3JraW5nIGFzIGludGVuZGVkLCBidXQg
bGV0cyB0cnkgdG8gZmlndXJlIG91dCB3aGF0IHlvdSdyZSByZWFsbHkgdHJ5aW5nIHRvIGRvLCBh
bmQgc2VlIGlmIHdlIGNhbiBmaW5kIHlvdSBhIHNvbHV0aW9uLg0KDQo+DQo+IFNjcm9uIENoYW5n
DQo+IEUtTWFpbCAgU2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tDQo+DQo=
