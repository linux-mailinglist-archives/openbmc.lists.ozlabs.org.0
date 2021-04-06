Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB07C355783
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 17:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFB1K4dVVz30B4
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 01:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=O6eYeuKK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.93;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=O6eYeuKK; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2093.outbound.protection.outlook.com [40.107.236.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFB122LLZz2yjB
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 01:15:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdI8UyNQbXTb6EN6hCitAYOFRAio9iXYHkn2fero3De5aA4cGWqR0czSirgl2QZFXxA+zBX9uxcv/xluY8su1OIr2G5mPhxi1+PKPLodfcQw33e357t6FMPapJGRVc8iGPRyBiCvzeFapsYzZUzghoCC8IumCCkayiB1KrqxLsg3qwVJCT/KLjCoVxOpcRulvK6zoZ1JOtvustzOUEnqpX0k0M+8HBGkRM1kXhwVNmPpyFQBB+mdNCcvPzSeaBtoWcNt+MFF1kVjWy7XchuNhg35ugWQ6DphlbjY5tIr0S+ubxyUhnqdJR+xZC7O8hr5fCn+8xyXSVSL56ouvThs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBMX9LfVdmLJUEqOezN2CsTsX/etc7xi5kWzPDt/o0=;
 b=Z0oE3vfcRp1GvG3gKYSw3ERGT9jFncnco4g8EAHNDfTTHTTYFvfy3xsP00CYFKNXvMTSsz7s2GUV5ggMF4DH4ApMcggTxRLH1mxfjrfAtGpZoAvXFljMivj2WssEqCbzzLwZocP9uXbwd4O8cHqLA1AH4wdZRWHRXJOoiGBMf24p3m/BwMJSeB20tHFsziUsDI9Oe2BfQdcjz7hrhZ799Rjx4+HDsd3P6JsLkY+3kPZpKaJXSgZF9zHlSIO7E/hVboS7H1ZrniXzb8C8nmCzkIa+XO+RnEpxChFHcj7NowRFrUKPkKki+Ae3mrwwA1YoUcuMCeJc/RQeXuOEA4ldVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBMX9LfVdmLJUEqOezN2CsTsX/etc7xi5kWzPDt/o0=;
 b=O6eYeuKK0XcTo698H+P1XJQ2QBMTt8Y5xzMZL50VeMFU3TmMTdhoxTDSgxqxgnPhLzckd9Mr07YXdS0qyL7k/rPN4N+nKr+J/fd/EnAFlqNZX3oPeF7Iwgv55DqbLmbPdLW5N6XHZpyOBcN6Ap9v4VWcojDm4FTjHmKDKP+9Dgw=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR01MB2474.prod.exchangelabs.com (2603:10b6:3:3c::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16; Tue, 6 Apr 2021 15:15:26 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 15:15:26 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Topic: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Index: AQHXJdOU6ZunssCJTkiHUAYwame9R6qmJvkAgAHyD4A=
Date: Tue, 6 Apr 2021 15:15:26 +0000
Message-ID: <7A4A2FFB-D2DF-4344-8ED6-09ABDC6DD4F7@amperemail.onmicrosoft.com>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
 <CAH2-KxDCK4P5jsPxCfa3cS962SOoDfoeM0XVpAqVRjE_VGiJ_Q@mail.gmail.com>
In-Reply-To: <CAH2-KxDCK4P5jsPxCfa3cS962SOoDfoeM0XVpAqVRjE_VGiJ_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2402:800:6344:7949:c4d7:b1a3:559f:d358]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38ca2c83-4cf3-4356-5971-08d8f90eceb4
x-ms-traffictypediagnostic: DM5PR01MB2474:
x-microsoft-antispam-prvs: <DM5PR01MB2474964147AF3DB85714EDFC90769@DM5PR01MB2474.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o8h1m63LIFG2/LEut7UaGWCjl87URcNtcdVrV6cLxHrLzmVd1VC7nPazqozE0Fg+aootsNh1Ct7yNJutV4Eh2TmMxl0DLJDHrRJF/RWVEl+4OCBezIlA/HeUK6LfziERODa18VyuzWFYWqCbQ1zQ7Qu4rt0F6VCg9oR92+OP86TM0sEc5GyySIb+G8WmeTwyUa77LhQUrJTUl2aKM3iHipXS8ffLRQo8nGMHGYqFzqRSxkgM63UWzPX6MCIYQBWR9HdyQxWw6lHQgExTz1qb/YMfSHpFGbMXNdyqQhGmXlVXAM6XDYtBd7v7btAEhXGR7RalGwxxqBR2Qrl/P3z8IvIbJcD1Z8OzjSYUyVqnDoeMfxgFzfjwjiyrMZ5e4wrL6uYXaBPmUugLI5M6SyyK1mT3F3LbapKWXoKDnsGGAc0YPNzROVYQxT8Jsh1PJmmFIGrgJ20BTZXZnLpZ/oDLRaHj7BnOjl0aD1UZm9sE8+Bsm25jvvTcdQAjNKQ/ZJ4jjTV6wcMjNRvpcsi79Ygtg4qyDwJuKSUX/JPpq4fDszpWCE1o1AwsnrRTICtMu4CJo4iL4TxaS3rQkDSU747b2bza2HzDbvW2rwZKGtDOlDd6fHkKzBwU6UvO2q3UQQ7M6INc2cV0IebJa9CLtXmYjTfCh13opsnnyTdU4jQZlSY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(478600001)(71200400001)(38100700001)(66946007)(66476007)(91956017)(76116006)(8936002)(4326008)(66556008)(83380400001)(66446008)(64756008)(8676002)(6512007)(9686003)(186003)(2906002)(5660300002)(6916009)(86362001)(6486002)(6506007)(53546011)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aXdRemlST3VqdCs4S29rSExKTnRmSHVWTWgvTmNMQnJ5d0lDbUdRbmg1Tmdu?=
 =?utf-8?B?aUltWUVsMWRSeWZFZUhYOWZFVjBhYTM4aTZnREcxajQvZ0tvVWJ4R0VmRDBL?=
 =?utf-8?B?MXpreXNucVlmS2pLUTZBb1IwcnJCbk9odklIT2liZGRsdVVrb3I1SHVqK2dq?=
 =?utf-8?B?VDlJaGVZVzBTZkVvQ3ZvbHJyL2dVYW84WHk2RU5GMytOWThWMC92MmRmVlFw?=
 =?utf-8?B?V085WFhYdU9qVjRQL3E1V1FqYndFVjVVWnZUNFdqeWdsNFZyWWE1R3NwcDV5?=
 =?utf-8?B?ZVlocUlHQXduL29oY3ZQMlZJZVBiZlRKdjI2MzdIOTB5WHZNVGlsb1FBTlhN?=
 =?utf-8?B?VlFMOW5kaUVTbDNrNTk3UjBsZDZDUzVjRzBXUG9OVzdHOXA1N2ZCZkhvY0pH?=
 =?utf-8?B?NzVLQ3R1OG44RlZaWVV2QTE0aERMcWJwUGtBdjRTV0t1TkhjaUJHbGhiekti?=
 =?utf-8?B?c3hRVXc3bG1uaStzTUNMQUJUd1R0Vk5kZk94ekRudGU1dEprdG85OG1ROGc4?=
 =?utf-8?B?WFd3VVIxOGdBeHlNZ1Jodm9CTEdIeVkrSkw3UGhzcjhxRFpoemx1dDFKT3lt?=
 =?utf-8?B?eWFhTWkrcEZTc1M3U083dnp4T0c2ZlJGbVdpdXdxR1BsZVNYbkxJK2NaejVa?=
 =?utf-8?B?cTZkOEs0MUtLRmd5NnI1L1hOdmJWZE84eHBiWlJaQkoyekxJaVhQZU5ocUc5?=
 =?utf-8?B?QWxSSmlSQWs4Myt6Y2tJRzRRNGtZVFQyR0dURGZVS3BWbWliSjU4b0xFMmow?=
 =?utf-8?B?ZmUvdmhRVEpTbnVZQ2dzWDJwL0tmczN3Y2s4dzBHQmhDL01ERUdERGNPdlp1?=
 =?utf-8?B?TmllZk41SHZnRXkyalIzQ0k3NEl0MVRnZ1crOXZlZHNtc3BtOXR5citQVWE2?=
 =?utf-8?B?U1NNSDUxWTA1Q2Nua2tYbTZkUFJubnBnU1FnTGZYSjdkSHdkR2F3RW1MczVN?=
 =?utf-8?B?WjNRaVJDY01IMVNDSDJJRTltVUl3bk9iRjRWYzRkR25GQ2E2RHhqTW5sMEly?=
 =?utf-8?B?NFhvYzNlZVoxYjltcmxDV2p1OTczZnJwdm5lOGdzS0xnZ2xPWVdnSzRRNTc4?=
 =?utf-8?B?Z0ZCYVNXKzNKdXRJUEFXenVqZ0EyTDhQZk53TmRPMHRjbUxySGlsYjZPa00r?=
 =?utf-8?B?cVpNNmthWWZSUDB3cURrYUx4RUU0STRVa2VQdkxQOEMxUGFsYW82THlCSGVS?=
 =?utf-8?B?a2NYZHIxc2pINVhHNWxhcThCdmdlSTZYSEJseVJmaGRHdGxqTTIxU29kR2g4?=
 =?utf-8?B?d09qN1g2OXlJeGx1bmU0WlpYUmlYdnVicmxMUjVud1h1U2VMWWhERVNEUG9r?=
 =?utf-8?B?RXJSS01BTUdCaS81OUJMdmYrQk94a3doUWk3RDZsS0pqZ2h1Nm1za2pxVVNF?=
 =?utf-8?B?SDBvNmVTNDlmZXllc2o4YlFnY0gyRGhrK1JNa1RGSFVUYjkvNERGRnVtU1FY?=
 =?utf-8?B?SjZGNXFxaFZMZTY2UlFRYkRrQ2czaVdGbE95a1NSMGlaNmNvQUhDYXpJV1NF?=
 =?utf-8?B?SlNkVU1IbEJKeHZSRDh3TnF1UUMzY09oWldiQW9ENVdIQkFtTFVSbzBoZGIy?=
 =?utf-8?B?NUdla2hoSnRBd0p5U0lyd0dXUTByUlEzaWcwUzExSXlGb2NCenhZOU5WUFRO?=
 =?utf-8?B?TE9ibE93VmhESWVNcGx1N1A3UjVDaWx2WmRDUkNmdk51Q1RLRHRESElPaTN2?=
 =?utf-8?B?bWQ2QmM1dHcyS2UvbHdwU0hqeTVWMGJBUzNpcG82Nk5nKzJwcWFtV3NTeVdL?=
 =?utf-8?B?R3R5N0pJOGNSOWxLRFZyeXJYN1VpdEhjaWMrR1dxR3J0cGRDcXFrS2xMVlFh?=
 =?utf-8?B?amw5aHBGclpmejgydEtuRzJWc0g2dFNrTkVPdzdEaHpKR3g4YmhmZDJkZ0tn?=
 =?utf-8?Q?/16Hv3lihXEnx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0498E6DF9A0B0F4CBBE1DF6E9ACC8885@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ca2c83-4cf3-4356-5971-08d8f90eceb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 15:15:26.4680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qJ87ZIkxbAsvUlA3b+UD1+XsYK+wSXctQcbMYy+WPuD+H08TIrIeiga1g/vrH5xCHkX8od59bpZ4jNVniZmTqfY8vYelwtsVVC7xuCmj0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2474
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

DQoNCu+7v09uIDA1LzA0LzIwMjEsIDIzOjMzLCAiRWQgVGFub3VzIiA8ZWR0YW5vdXNAZ29vZ2xl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIE1hciAzMCwgMjAyMSBhdCA3OjE0IFBNIFRodSBO
Z3V5ZW4gT1MNCiAgICA8dGh1QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+IHdyb3RlOg0KICAgID4N
CiAgICA+IEhpIEFsbCwNCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IEN1cnJlbnRseSwgSW4g
TXRqYWRlIHBsYXRmb3JtIG9mIEFtcGVyZSwgd2UgaGF2ZSBTTVBybyBtZGYgZHJpdmVycyAoU01Q
cm8gaHdtb24sIFNNUHJvIGVycm1vbiwgU01Qcm8gbWlzYyBkcml2ZXIpLg0KICAgID4NCiAgICA+
IFRoZSBkcml2ZXJzIHdpbGwgYmUgbG9hZGVkIGJ5IGtlcm5lbCB3aGVuIHRoZSBCTUMgYm9vdCB1
cC4gQnV0IHRoZXkgYXJlIG9ubHkgYmluZGVkIHdoZW4gdGhlIGhvc3QgaXMgYWxyZWFkeSBPbi4N
Cg0KICAgIEFzc3VtaW5nIHlvdSdyZSB1c2luZyBkYnVzLXNlbnNvcnMsIHlvdSdkIG5vcm1hbGx5
IGp1c3Qgd3JpdGUgYW4gYXBwDQogICAgdGhhdCdzIGNhcGFibGUgb2YgdW5sb2FkaW5nIHRoZSBt
b2R1bGVzIGFuZCB3YXRjaGluZyB0aGUgcG93ZXIgc3RhdGVzLg0KICAgIEV4cGVyaWVuY2Ugc2Vl
bXMgdG8gc2hvdyB0aGF0IHZlcnkgZmV3IHRydWUgInJ1bGVzIiBleGlzdCB3aXRoIHJlZ2FyZHMN
CiAgICB0byB0aGlzIGtpbmQgb2YgZW5hYmxpbmcvZGlzYWJsaW5nLCBhbmQgYXMgaGFyZHdhcmUg
Z2V0cyB1c2VkIG1vcmUsDQogICAgbW9yZSBvZGQgZXJyb3IgaGFuZGxpbmcgc2VlbXMgdG8gcG9w
IHVwLCBzbyBhcyBhIG1hdHRlciBvZiBkZXNpZ24gd2UNCiAgICBwdXNoZWQgdGhpcyBpbnRvIHRo
ZSBpbmRpdmlkdWFsIHNlbnNvciBkYWVtb25zIGVhcmx5IG9uIHRvIHRyeSB0byBrZWVwDQogICAg
aXQgc29tZXdoYXQgc2FuZSB0byBtYW5hZ2UuICBkYnVzLXNlbnNvcnMgc29tZXdoYXQgdGFrZXMg
dGhlIHBvc2l0aW9uDQogICAgdGhhdCBvbmNlIGFsbCBoYXJkd2FyZSBpcyBkZWJ1Z2dlZCwgdGhl
cmUgaXMgbm8gImNvbW1vbiIgc29sdXRpb24gdG8NCiAgICByZXNldCwgYW5kIHdlJ3ZlIHByb3Zl
biB0aGF0IG9uIHNldmVyYWwgb2NjYXNpb25zIHdpdGggb3RoZXIgc2ltcGxlDQogICAgc2Vuc29y
cy4NCg0KW1RodV0gSSdtIHVzaW5nIHRoZSBwaG9zcGhvci1od21vbiwgdG8gY3JlYXRlIHRoZSBz
ZW5zb3IgZGJ1cyBvYmplY3QuDQpJIGRvbid0IHVzZSBlbnRpdHktbWFuYWdlciBhbmQgYWxzbyBk
YnVzLXNlbnNvci4NCldpdGggcGhvc3Bob3ItaHdtb24sIHdoZW4gdGhlIGRyaXZlciBpcyBiaW5k
ZWQsIGFsbCBvZiB0aGUgY29uZmlndXJlZCBzZW5zb3JzIHdpbGwgYmUgcmVhZCBhbmQgdXBkYXRl
IHRoZSB2YWx1ZSB0byBkYnVzIGJ5IHBob3NwaG9yLWh3bW9uLg0KSXQgc2VlbSB0aGUgcGhvc3Bo
b3ItaHdtb24gaXMgd29ya2luZyBhcyBleHBlY3RlZC4NClRoZSBwcm9ibGVtIGlzIGN1cnJlbnRs
eSBrZXJuZWwgZG9uJ3Qgc3VwcG9ydCBhdXRvIGJpbmQvdW5iaW5kIG1lY2hhbmlzbSwgc28gSSBo
YXZlIHRvIGRvIHRoYXQgbWFudWFsbHkuIEFzIG15IG9waW5pb24sIFdlIGNhbiBhZGQgYmluZGlu
Zy91bmJpbmRpbmcgdGhlIGRyaXZlciBhcyBzZXBhcmF0ZWQgZGFlbW9ucyBvciBpbnRlZ3JhdGUg
aXQgdG8gcGhvc3Bob3ItaHdtb24uDQoNCiAgICBPdmVyYWxsLCBJJ2QgcmVjb21tZW5kIGp1c3Qg
d3JpdGluZyBhbiBBTURDcHVTZW5zb3IgYXBwbGljYXRpb24sIGFzIEkNCiAgICBzdXNwZWN0IHRo
aXMgaXMgdGhlIGZpcnN0IG9mIG1hbnkgc3BlY2lhbCBjYXNlcyB0aGF0IHRoZSBwcm9jZXNzb3IN
CiAgICB3aWxsIG5lZWQuDQoNCiAgICA+DQogICAgPiBUaGV5IGFyZSBhbHNvIHVuYmluZGVkIHdo
ZW4gdGhlIGhvc3QgaXMgT2ZmLg0KICAgID4NCiAgICA+IFRvIHN1cHBvcnQgYmluZGluZy91bmJp
bmRpbmcgdGhlIFNNUHJvIGRyaXZlc3IsIHdlIGhhdmUgb25lIHNlcnZpY2UgbmFtZSBkcml2ZXIt
YmluZGVyLg0KICAgID4NCiAgICA+IFdoZW4gdGhlIERidXMgcHJvcGVydHkgQ3VycmVudEhvc3RT
dGF0ZSBvZiBzZXJ2aWNlIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdCBjaGFuZ2VzIHRv
IOKAnG5vdCBPZmbigJ0sIHdlIHdpbGwgYmluZCB0aGUgZHJpdmVycy4NCiAgICA+IFdoZW4gdGhl
IERidXMgcHJvcGVydHkgUmVxdWVzdGVkSG9zdFRyYW5zaXRpb24gb2Ygc2VydmljZSB4eXoub3Bl
bmJtY19wcm9qZWN0LlN0YXRlLkhvc3QgT1IgRGJ1cyBwcm9wZXJ0eSBSZXF1ZXN0ZWRQb3dlclRy
YW5zaXRpb24gb2YgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5DaGFzc2lzDQogICAgPg0KICAg
ID4gY2hhbmdlIHRvIE9mZiwgd2Ugd2lsbCB1bmJpbmQgdGhlIGRyaXZlcnMuDQogICAgPg0KICAg
ID4NCiAgICA+DQogICAgPiBUaGUgZHJpdmVyLWJpbmRlciBpcyB3b3JraW5nIGFzIGV4cGVjdGVk
LCBpdCBoYXZlIHRoZSBjb25maWd1cmF0aW9uIGZpbGUgdG8gY29uZmlndXJlIHdoaWNoIGRyaXZl
cnMgd2lsbCBiZSBiaW5kZWQvdW5iaW5kZWQuDQogICAgPg0KICAgID4gQnV0IHRoYXQgaXMgb3Vy
IHNvbHV0aW9uLg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gRG8gd2UgaGF2ZSBhbnkgY29t
bW9uIHNvbHV0aW9uIHRvIGRvIHRoYXQgam9iPw0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4g
UmVnYXJkcy4NCiAgICA+DQogICAgPiBUaHUgTmd1eWVuLg0KICAgID4NCiAgICA+DQogICAgPg0K
ICAgID4NCg0K
