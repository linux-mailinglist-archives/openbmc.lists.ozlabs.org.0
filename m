Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B0346CF4
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 23:28:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4mHJ3VtPz3btG
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 09:28:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=jw5+jRvp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=704dd1d39=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=jw5+jRvp; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Thu, 18 Mar 2021 17:24:21 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F1H6s0VHLz30Bl
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 17:24:20 +1100 (AEDT)
IronPort-SDR: HWT/+bZqIIU1sr6V8nzk6f4XfRAkWT6rXbQ7CSOxPLqaFXgrcxhXcDE6PdLjHoiyHsFPQdKL4d
 h+GxFMCopA6Q==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx02.quantatw.com with ESMTP; 18 Mar 2021 14:23:11 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 18 Mar
 2021 14:23:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx09.quanta.corp (10.243.91.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 18 Mar 2021 14:23:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF55xGKfyDa4U7HdHNgZ0QDoUrt+q5oVx6mksXY68BfEDV0Mi6OTRdx6lplNeS7nWV5HhHiFvueFza6KgILJKieXfBZP5ByeyDJk11yDOonBu4td4Q7LHiLfEpIQas0OC9VdpBjArn40kbGvRdJdQ2zPnLepACBxP4aaEi8bw6Vj+wyPic0Cnv18ex/EZJ2U9RS9pCuXctoPovW7+A/8UUelN6PIsYkUR1WfZzXM9lzqWmy1SY4rQ6rNrQFaERyfxWNEi0YP2hF3FCc+DgarYPH1IN3NPXs0gFRhlNWp6WO21G7KNn8ExupNdLrLpddKBFuBjORso2Rjt6hD8azJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aardnJVcsuvVaqyab7tPZcyt+0FIvctAFFigtuxC+k=;
 b=iHQSlt2/37HphdsgVaFFP27sv+vetXFnwmGfZWHIJl3G7pn6Rb4+NYuuaVj+fhsyb2emN9dPDqWtJbA8WrxhoZGGZ9xuKxe5j2boI04rNi2v260QiOLValVXPRBe4h79Xl/I4VCTrkQCZ6lMYXOgEMu7ofgguVNrV/PRmmt2DXTgEI9enxOOtUfYn2eY6tdt/IflpIcFoKQn0wiIzjH7JFylS5ABEXI0qHq76XRzlP4no/9yIeFWWuj437Ne3auc59tsPBlG/EdfJV6zMY92O5lPF2AqGM1AdDSjNUyO7yZL8yJq5KF45dX7xeLsanByL8Rstf4PB/Pv34ronj1kBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aardnJVcsuvVaqyab7tPZcyt+0FIvctAFFigtuxC+k=;
 b=jw5+jRvp9iADIWf+BYf8XTFIfnhE3f+PGWZeyS+a7jY/VpBmoCxgAbtNvve9N7bEYeclcJG7srAmpz1UMaT9VzYzoCxydzuM3Rnpy+voZe69aeTk6SDUWTL29xmGnV6SUwY1KjSYlFZ6e8xHWA5pPgnczeJmAPnvd4xPTFGEuQY=
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com (2603:1096:203:87::9)
 by HK2PR04MB3668.apcprd04.prod.outlook.com (2603:1096:202:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 06:23:10 +0000
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::30e6:ad60:39c8:b18c]) by HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::30e6:ad60:39c8:b18c%5]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 06:23:10 +0000
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: ClientOriginIPAddress is 0.0.0.0 or ""
Thread-Topic: ClientOriginIPAddress is 0.0.0.0 or ""
Thread-Index: AdcRljI3k+qPSfe4S+C/ciz7rAAZ8AKKNQow
Date: Thu, 18 Mar 2021 06:23:09 +0000
Message-ID: <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d5d2bd3-fff6-48ec-8c0c-08d8e9d64d2e
x-ms-traffictypediagnostic: HK2PR04MB3668:
x-microsoft-antispam-prvs: <HK2PR04MB366823C4E1403FB369834C50B1699@HK2PR04MB3668.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S03AeVEqs9+rpgOfVh8Zn3/xDhlBid3Z+YxPxNfcBwPRdrUX0ub93QcBcvTLlmEtfx8NEUtEtir66Z8fU6LgtyhdVFtKKNimTMOQD58aozg+GuxVnp00MXOA/HmipLA8MeuzGOISMyiXFyV/VM7nLhf7ej9gmkk9G0xuVX7Fd2aROxsJcz0/ihiWdPjWR6nPOU1DUGz0OSmGDavhaLh7DlrCCWdCiFhPja5ugji/BDJuWTaxOuuNyr6E7WItn2hJZImvIwqyXhy9IXUKl+ZhirSxTyau2iLlBJAFMJG65oIJYY4nCY/OeREajtxmujxoGqkUopVh6bq61TrNT1mtzIcPdB8tO0BvEqtS7o1+551qHsdZo+gaGDFGgtOXEfRcHy8tsfAGSHdZAqVswoYxuBUg/xK/UAHc4yMdpIADRSBCUTNmx/oBv2jSnn0JnE/gKav91hebl5N99RBiGiNvmlNKOciGnvPjbh9QzxF7BeHvKcVjb/+2j/wZa/qv3rOFKm5h85my6X8WEHjdLDHGcMquB30bPSNePMxYynhiZda+OkKKkBOVzTdJ1govyB8CnZTlzmK7B+xFLswKNYwHH+60owf6F5g71AGksE1UBOE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3346.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(478600001)(166002)(53546011)(8936002)(71200400001)(7116003)(66946007)(76116006)(85182001)(66446008)(5660300002)(83380400001)(186003)(2906002)(86362001)(6506007)(9686003)(52536014)(64756008)(66556008)(6916009)(55016002)(66476007)(966005)(7696005)(38100700001)(8676002)(26005)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?L1luRmZoeDlZcHJtWE5VZW5PUDVFNExGdTltcTNjaXIvZ00zKzBya0ZNTDc2MFN1?=
 =?big5?B?a2Y3UWFmMktHSEo5alg5azRNS3JYKzcwZ3E4Q2wxQXRETHBQaUpOZ3lxSXBMQ2Fu?=
 =?big5?B?Umt4WTIzbWNOQm5HbVdQK29wTGo4d0hwb2QyUGNHOWtpTHNxSXVLTXZCVzB3MEVw?=
 =?big5?B?Nnk2RGxOVVU3L3JxZ1RUR3M5YjUrZDJ0cDBxR2VoYjJxTmh6ejNDZmlubGJ3QUlD?=
 =?big5?B?Q2NKWTEvZ2hsM3psOVFDMHNiSTZZek9WVjNhRWEyWTZEcDdJTzNNWUJ4V3gxdVhj?=
 =?big5?B?LzlIZ2kzRGljTW9oZGdKZTMvd051VmNDaytqNjNlR2NGemsrSklpOU1tdGtzeWFp?=
 =?big5?B?WjNaaTFZbkNWWkc5WWtaOS9GajRUbG9YdWFyYVJZcUFodHNiZ1h4Q1dweWkxK0k2?=
 =?big5?B?bXU5ZEYrWklLRStjN1ZISHA3NU1xQ3diV0NBWmFxRE1MQXdSOEp0Tk5icUdkcERU?=
 =?big5?B?L2JvOXBGRGV5YXlNSDFGNVZSYUlPSUY5UFpJL2pTMlJ4NitUUHhhTkpEQ29GZlNv?=
 =?big5?B?Yk1LbDhmb0xBUHhjTXBoRU1JMWFsV1FnOVZGWDgrZTAxRmJoWmttSVorbWVDSHhl?=
 =?big5?B?NDFMZEdPUVE4RitGaER2RlY4YWtMV3Exd0JSdHJqcjEyRWFFTWNzclFZY1ArRnNk?=
 =?big5?B?b0N5a1ZXUFpkbU0yZTNHQSswbGoyVm9OMmlvQm1xaFRYajdYV2FjUTQ0cWYyUkEv?=
 =?big5?B?dUtKaW5iMWpCbzkraHErUWVmUUtYZWVQczhBbERMSzIwRUgwQW1vNWl4bW9FdXRw?=
 =?big5?B?RXF3NStTdlF3RjFydW5ObGgrclRhRllCR0FUOW12clVnZ0V1alVjWWlvbUxwV1Vz?=
 =?big5?B?RE53YnU5ZStLTUtHRVJudmFKS1p0THljaG1mMExjM3lkUWVSQkMxcE5SN0NYUTJF?=
 =?big5?B?ck9zTDF4dS9xK2FRbkdlQVU4bTBNMXEzVlhCMHpvcnpxdGxldmhMOGQvZmxTUk9U?=
 =?big5?B?dm5QcWE3VlBTcktaSUpkQXhFUmJ6K2h2NkpCenhpVk1MMlFCbVAxeEI5cnFtNUFy?=
 =?big5?B?TlltTGZmQndiNWp0KzJqUjJ6UC9BWlFLRFBVWGxnb0pnOTFRVDU2TEhsWUxFbmg4?=
 =?big5?B?dGwzdHZORXUxSjFwTjZzNmhWUjZZWXEwNXVxdGhLaGNxNmlaamlES1FuQjhOS2U1?=
 =?big5?B?bUdCWmhXRDRYdjczTGRUb0VEMEdVOEZjSHBTbHlTUmRjZU51bVRaUkVxRlR1OVF2?=
 =?big5?B?L0lrRFNZbEwxNnNKdnlqKytpT1FWM01EdDhBOGkzREZBWmNpcWlkWW5UeUU3cE45?=
 =?big5?B?QWx6M2wyaGw2MWk2cUhpZDRmREt2eTZGQi9ocjVLKzlWZUM2WTU1dEtPMlh3a1Fn?=
 =?big5?B?UFJpSlV3T0NPdnRuQlRyV2Jqc1FEbFN2Rkk0cTdnY0VpZFRMY2tFV3pQY2VjVVhS?=
 =?big5?B?OTNqcHdER2MxQWNOcnF6MlZrRm9Gb0ExU3d1bEZGT25sT3llMVdkakw0SGI1WCto?=
 =?big5?B?NEEzdjVobjRvZGxtT3BpWFpqN2tzSHFlQzd6R292ajE4eG9GK2VLRzdRUUlPK29y?=
 =?big5?B?cDhBRXk5TW5sVjYzR3E4Z1BNSTFPWkl3VEh5dkZXancxb3ZnMXNqa3hzUHJtOG5G?=
 =?big5?B?QWhVaXlTbHRpTmVZMkU0Ulltdk9aYmZuMDdITTBlWUdnOEZSV3c1d283allDNExV?=
 =?big5?Q?872BeoPUtImOU7hB1GCNYaTH5XI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB3346A7C9EA60289912747398B1699HK0PR04MB3346apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3346.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5d2bd3-fff6-48ec-8c0c-08d8e9d64d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 06:23:09.8915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nEmeK/OH77iRAOZL5rSksE4krQWxdYDV+8cQJo2mgS/X3so5EpYeDdrHH6bYOHj6TaJmtzkoP/UMsMnSvNHC5JX8/02AE2sz1neu/aJWa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3668
X-OriginatorOrg: quantatw.com
X-Mailman-Approved-At: Wed, 24 Mar 2021 09:25:27 +1100
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

--_000_HK0PR04MB3346A7C9EA60289912747398B1699HK0PR04MB3346apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQpJZiBjb250aW5vdXNseSBzZW5kIFBPU1Qgc2Vzc2lvbnMgUmVkZmlzaCByZXF1ZXN0IHZp
YSBQb3N0bWFuLiBJIG9ic2VydmUgYm1jd2ViIGRlYnVnIGxvZ3MsIGl0IHdpbGwgZXN0YWJsaXNo
ZWQgY29ubmVjdGlvbiBhdCBmaXJzdCByZXF1ZXN0IHRoZW4gbm90IGZldGNoIHVzZXIgaXAgYWZ0
ZXIgdGhlIHNlY29uZCByZXF1ZXN0Lg0KDQpUaGF0J3Mgd2h5IENsaWVudE9yaWdpbklQQWRkcmVz
cyBpbiBzZXNzaW9uIGFmdGVyIHRoZSBzZWNvbmQgY3JlYXRlZCBpcyBhbHdheXMgMC4wLjAuMCAo
bm90IGJlIGFzc2lnbmVkKS4NCg0KSW4gSFRUUCAxLjEgSXQgdXNlcyBrZWVwLWFsaXZlIEhlYWRl
ciBkZWZhdWx0LiBzbyBCTUMgZG9lcyBub3QgZmV0Y2ggdXNlciBJUCB3aGVuIGl0cyBjb25uZWN0
aW9uIGlzIGVzdGFibGlzaGVkLg0KDQpJcyB0aGlzIGJlaGF2aW9yIHdlIGV4cGVjdD8NCg0KQmVz
dCByZWdhcmRzLA0KSnVuLUxpbiBDaGVuDQoNCkZyb206IEp1bi1MaW4gQ2hlbiAos6+rVMBNKQ0K
U2VudDogRnJpZGF5LCBNYXJjaCA1LCAyMDIxIDQ6MDUgUE0NClRvOiBzdW5oYXJpc0Bpbi5pYm0u
Y29tDQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBDbGllbnRPcmlnaW5J
UEFkZHJlc3MgaXMgMC4wLjAuMCBvciAiIg0KDQpIaSBTdW5pdGhhLA0KDQpJIGZvdW5kIHNvbWUg
cHJvYmxlbSB3aGVuIEkgY3JlYXRlIHNlc3Npb24uDQpUaGUgcHJvcGVydHkgoadDbGllbnRPcmln
aW5JUEFkZHJlc3OhqCBpcyChp6GoIGFmdGVyIFBPU1QgaHR0cHM6Ly8ke2JtY30vbG9naW48aHR0
cHM6Ly8kJTdiYm1jJTdkL2xvZ2luPiAtZCAneyJ1c2VybmFtZSI6IDw+LCJwYXNzd29yZCI6IDw+
fQ0KQW5kIGl0IGlzIDAuMC4wLjAgYWZ0ZXIgUE9TVCBodHRwczovLyR7Ym1jfS9yZWRmaXNoL3Yx
L1Nlc3Npb25TZXJ2aWNlL1Nlc3Npb25zPGh0dHBzOi8vJCU3YmJtYyU3ZC9yZWRmaXNoL3YxL1Nl
c3Npb25TZXJ2aWNlL1Nlc3Npb25zPiAtZCAneyJ1c2VybmFtZSI6IDw+LCJwYXNzd29yZCI6IDw+
fScNCkJvdGggb2YgdGhlbSBsb29rZWQgbGlrZSBzb21ldGhpbmcgd3JvbmcuIEFuZCBJIGFsc28g
bG9vayBmb3Igc291cmNlIGNvZGUgaW4gYm1jd2ViIHJlcG9zaXRvcnkuDQpUaGVyZSBvbmx5IGRl
ZmluZWQgdGhlIGRlZmF1bHQgdmFsdWU6IKGnoaggaW4gZ2VuZXJhdGVVc2VyU2Vzc2lvbigpIGFu
ZCBub3QgZm91bmQgZmV0Y2ggdXNlciBpcCBpbiBlbHNld2hlcmUuDQpJIHRoaW5rIGl0IGlzIHdo
eSBDbGllbnRPcmlnaW5JUEFkZHJlc3MgaXMgc3RyYW5nZS4NCg0KTWF5IEkgYXNrIHdoYXQgc3Rl
cCBvciBzb21ldGhpbmcgSSBsYWNrIGluIGNyZWF0aW9uIHNlc3Npb24gc28gdGhpcyBwcm9wZXJ0
eSBpcyBhYm5vcm1hbD8NCg0KDQpCZXN0IHJlZ2FyZHMsDQpKdW4tTGluIENoZW4NCg0K

--_000_HK0PR04MB3346A7C9EA60289912747398B1699HK0PR04MB3346apcp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If continously send POST sessio=
ns Redfish request via Postman. I observe bmcweb debug logs, it will establ=
ished connection at first request then not fetch user ip after the second r=
equest.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That's why ClientOriginIPAddres=
s in session after the second created is always 0.0.0.0 (not be assigned).<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In HTTP 1.1 It uses keep-alive =
Header default. so BMC does not fetch user IP when its connection is establ=
ished.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is this behavior we expect?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Best regards,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Jun-Lin Chen<o:p></o:p></span></i></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> Jun-Lin Che=
n (</span><span style=3D"font-size:11.0pt;font-family:&quot;=B7s=B2=D3=A9=
=FA=C5=E9&quot;,serif">=B3=AF=ABT=C0M</span><span lang=3D"EN-US" style=3D"f=
ont-size:11.0pt">)
<br>
<b>Sent:</b> Friday, March 5, 2021 4:05 PM<br>
<b>To:</b> sunharis@in.ibm.com<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> ClientOriginIPAddress is 0.0.0.0 or &quot;&quot;<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Sunitha,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found some problem when I cre=
ate session.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The property =A1=A7ClientOrigin=
IPAddress=A1=A8 is =A1=A7=A1=A8 after POST
<a href=3D"https://$%7bbmc%7d/login">https://${bmc}/login</a> -d '{&quot;us=
ername&quot;: &lt;&gt;,&quot;password&quot;: &lt;&gt;}<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And it is 0.0.0.0 after POST <a=
 href=3D"https://$%7bbmc%7d/redfish/v1/SessionService/Sessions">
https://${bmc}/redfish/v1/SessionService/Sessions</a> -d '{&quot;username&q=
uot;: &lt;&gt;,&quot;password&quot;: &lt;&gt;}'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Both of them looked like someth=
ing wrong. And I also look for source code in bmcweb repository.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There only defined the default =
value: =A1=A7=A1=A8 in generateUserSession() and not found fetch user ip in=
 elsewhere.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I think it is why ClientOriginI=
PAddress is strange.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I ask what step or somethin=
g I lack in creation session so this property is abnormal?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Best regards,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Jun-Lin Chen<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR04MB3346A7C9EA60289912747398B1699HK0PR04MB3346apcp_--
