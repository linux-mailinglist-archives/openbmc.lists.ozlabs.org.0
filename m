Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED02A4D81
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 18:53:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQcp168F6zDqjZ
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 04:53:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.5;
 helo=mail1.bemta24.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-LenovoBeijing-onmicrosoft-com header.b=OFvw8Mcb; 
 dkim-atps=neutral
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQcmr5PLyzDqft
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 04:52:11 +1100 (AEDT)
Received: from [100.112.131.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.us-west-2.aws.symcld.net id 24/90-13169-6C891AF5;
 Tue, 03 Nov 2020 17:52:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLJsWRWlGSWpSXmKPExsWS8eIht+6xGQv
 jDWac4LLYdZnD4uGGT8wWp1pesFic3e7vwOJxtX0Xu8fOWXfZPRZsKvU4P2MhYwBLFGtmXlJ+
 RQJrxsmd+xkLJlZUnGv7wdrAuKesi5GLQ0iggUliWcNkZgjnJaPE02mvmSCc/4wSe+e/B8pwA
 jm/GCWanoeB2IwCS5kl+luKQIoYBY6xSFzr28sE4WxglOj+9ZkRxGER2M0sMWfvNlaIWfOYJJ
 ZO+QG15R6jxNQ1LWwgw9gElCRaXq1gB7FFBNQkzjw9CFbELNDIKHHjQxsLSEJYwETi/Y8nLBB
 FphJbNu9hhbCNJN782M0IYrMIqEhsX3CBCcTmFYiR2H/tP9Qbn5kkPi0/DlbEKRAocfnKL1aI
 N2Qlnix4BtbALCAuce5iK9gVEgICEkv2nGeGsEUlXj7+xwrxXQ+jRPuTVUwQCUWJtxt/QTXIS
 lya3w20gAPI9pVovmQFEdaSaN73kRXCzpb4tfsxI4StJnHjTQfUfDmJVb0PWSYwGs5CcgaEnS
 cx68BBlllg/whKnJz5BMjmAIprSqzfpQ9RoigxpfshVLmGROucuezI4gsY2VcxmicVZaZnlOQ
 mZuboGhoY6BoaGukaGhvomhrqJVbpJuqVFuuWpxaX6BrpJZYX6xVX5ibnpOjlpZZsYgSmuJSC
 JuMdjJvffNA7xCjJwaQkystZtzBeiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv6HSgnGBRanpqR
 VpmDjDdwqQlOHiURHhdQNK8xQWJucWZ6RCpU4yuHBNezl3EzPHu52Ig+XHVEiD5HUwembt0Eb
 MQS15+XqqUOK8aSLMASHNGaR7caFiuuMQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcRZAp
 PZl4J3AWvgI5jAjouInwByHEliQgpqQamPNUjHLIGsY/iH/9UfDWnvay0Xuic+PxX/27N3CAy
 75ud7S3nOfn/hJ4/TVg9a/OW4L91n42aIosehsZeb2h/lLb4Wabr4ZS3/ve+nF/9YOoZNsXf3
 rpCmx6u2SNU0qQvvczSeJ+zRv2Gp2bcFs/2fq3wnP9/y/pFJwM1D+26yLZk2iRlqeNfY4+l8F
 ffL/beu3JFyDsHvUzx1rlzD2tsPP5487VJcTES/CILvZxffM3KrDfOUnvWbmL7bmfvxpqpdsl
 vTHuM9p7z455o1dVn0NZ63/LZ7CixiYwdZzTeG6+Ss+7vWJwaHCIhna3yiC22zbJzAZ8pr6KC
 9c2ugJDth/+vahGUndYTL5lfdtddiaU4I9FQi7moOBEAcJ13a5AEAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-22.tower-326.messagelabs.com!1604425924!11046!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23679 invoked from network); 3 Nov 2020 17:52:05 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
 by server-22.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Nov 2020 17:52:05 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 2D6475C54DBC9BC50A5C;
 Tue,  3 Nov 2020 12:52:02 -0500 (EST)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Wed, 4 Nov 2020 01:52:45 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL03.lenovo.com
 (10.128.3.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4 via Frontend
 Transport; Wed, 4 Nov 2020 01:52:45 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.57)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Wed, 4 Nov 2020
 01:52:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AESuU27xsQdH+I3BCB7i+dHkFS01Z1WmV3il5fFfm73PEsEU9M53su8GBeugNKXORW10c8050inEnZIpITC4ntMj/SrOV9iQqWT57MaSgbGaIUt6gL8wNA3vlQMQ3Bf+lH3775jqedL7ZJTH9VtKmarT4YBRAvL5KqwYgYDmiWOKX6eCaMHXZ3synpRhZZDTlsKtcSnczCjWfnzOms2XFBfEHHFOUESeAJPupI/kDvsWXS3ztB7IDlSXzLzRHpEXRoZSJ1oU6I4n4OaN2Vannf8pkQr35zM8NosfxQZHVDAdQJOlh4RLo7W5Odnla1Una16FZEai9vz1s33gQjLh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJz2U2N+3maO9XleBXHzuq1E3NT6IjzBFmOyN9Mcj7g=;
 b=GE7mubqNQ4ZJ/BO7DGpPkQeyQ9lNq5g88jzoohc2JfC9jyrrU+a6NLFxrT12mVmgpm9txsICLxYjhZ9s7WmPKMaMQNueB3jEEDp5C3zQ9RSfDCKaj+wmcs0Kp/CMlglCgFp3tN5Qxz4KBAux2g/EG2GdrPpIn9oes6lZRHCeDZFJSwV4XKGqU4em/W7kraMQQK3Rkg7m4BEOfn/y5sESWCpkX5G3V1t3ARrsDqFh2l912MdBU4OkNt+IuhcBss9+NnKS8afdfOQBEwfK7nSVh2m3db0KhfkoFLxhF9FxBGC8npD/pwVl+s1wdS5n0Gt1ti4wwo9qmrfegGYW3o0PJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJz2U2N+3maO9XleBXHzuq1E3NT6IjzBFmOyN9Mcj7g=;
 b=OFvw8McbEUvtTvG45TwIr0VZyIGW8lXi3wf8Mc4UBVprc/xMSRHcex9qN1T5AkqrCWACiFjzSirEvOVYYCpscDHUuM457IwT0Gf3QAlYd9eHRTOIUS+K3kQcIn5VDmIgfySlkI+ojtjEtCnvuxKIl/g6RBKHhoaRLtq7iQda+Yk=
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com (2603:1096:202:27::17)
 by HK2PR03MB4369.apcprd03.prod.outlook.com (2603:1096:202:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Tue, 3 Nov
 2020 17:52:00 +0000
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3]) by HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3%5]) with mapi id 15.20.3541.017; Tue, 3 Nov 2020
 17:51:59 +0000
From: Ivan Li11 <rli11@lenovo.com>
To: Anton Kachalov <rnouse@google.com>
Subject: RE: [External] Re: SELinux support question
Thread-Topic: [External] Re: SELinux support question
Thread-Index: AQHWsVFygIETV5Ya30ys4FEyciqfj6m2qFMA
Date: Tue, 3 Nov 2020 17:51:59 +0000
Message-ID: <HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110@HK2PR03MB4580.apcprd03.prod.outlook.com>
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
 <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
 <HK2PR03MB4580C4DF82B1089E34B97311D3100@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CADVsX8-9FMwUrjnNzKdEX2CRHRNr0nwFyy74U74OozQHWfXpVA@mail.gmail.com>
In-Reply-To: <CADVsX8-9FMwUrjnNzKdEX2CRHRNr0nwFyy74U74OozQHWfXpVA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.250.179.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11643fd1-8173-434f-a2f4-08d8802129f3
x-ms-traffictypediagnostic: HK2PR03MB4369:
x-microsoft-antispam-prvs: <HK2PR03MB43697D4031D7A13AD82559F5D3110@HK2PR03MB4369.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +tk8Tnm8+Ygscm313r3ygfziS/c/AbIxyPJZdzT6F3NgbzhOO2k71RKSucxW39P7SmJOmygtohdQUfoGgCqPwR72JqGH71wJW3Ms66PpY3/w7Y4z5QnAQ299ObTa2aRojZZgyAgEINVbDZh+SeJ0V0pbRe3ymZlbctdzBX23sOCiphw9ANXkMfneUBkRxjhhcuzT9PtgJH0Tf8a8m1fJOC88KGR1+e158iQ3VAHuWqND+Ies9kS28eTTS5ukaEGxjWvqg9gp7mvTq/yyDfV5GOX3AUp3+Rek6mVjwF5BkcoI8rQ9OM3j7F4gQ+OFeHEwpcWTkuduWhqhzH6zUs6e0+qW+c4V8GgdyQXn7wyjOJZWQBLYbRZnOpbomzR+qTBqJu+uAcIQXb6fXo2QpC4qcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4580.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(86362001)(166002)(7696005)(83380400001)(55016002)(6506007)(53546011)(26005)(186003)(71200400001)(33656002)(966005)(9686003)(6916009)(316002)(2906002)(54906003)(5660300002)(52536014)(66946007)(64756008)(66556008)(66446008)(66476007)(76116006)(478600001)(8936002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0dSNTzoa6dLUQZalJWuwjYl6e5qcg5lel08bJyZtD9J+VkheYlx5aYbuut/xtUnxr5kFKPsGnOsDTwAgKLuGxztFUOMnCDiWstQhyLzZlekFvpIUyQV6IZYLGnlUFyR7M1sNxdmlVdx2FhWqFeyBKepu47x2ZsoygbJBy0YdIGr1FwkaBWN+hYVaaxdiFL+fCAk7OWKe5HsT+NcX3mz4JbxO8I/vEf3LYxo/OGSByNDw8QbcIogybPk8GcvUwCtrMdGip+5KetcDzwS9Gw7iUgObEAZknufE1BKuUVfHFxk1S7ntCNNp/LJWFXBFNHuDhfQpue7VOTvokDCtKRQVjvkHBz6kUc5udl5fyNi+Cx+qxz0q3XxYcwfw0qcjTzvrSwmuhAMSUfMJOU4TL3V0/s0FXaNhOgcYLcivyreTsw6P1iwlBg5TpdQREHCNspPEm0CL9FDvV38GKZqwj/sMyIz0s7Ele1OumftCz5AzDZg6T9BaQdNpkqTR3NHKiotfGXChabBd+d+Ck3m5xAfrg9Gh5M8r+UUpog1EyrUy5sG/FOrAU1+TBAd4Pjr0wBRkM5KRGUfdIeAN3ey/2VCCK7KfrgGRNQASAq9b5jdCWADEJGqUXPG/JB/fRSUGmbGtNJC1+KMLNKBwYQPJic8PyA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110HK2PR03MB4580apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11643fd1-8173-434f-a2f4-08d8802129f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 17:51:59.7614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNZzSQbnfrdZi5sGO0xvLkhydkUFvAF47UlsCBY61M5NiEtT1CTT22a9EHhkYn93UjKfgD5+Q/fBdaQgLmvdxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4369
X-OriginatorOrg: lenovo.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Artem Senichev <artemsen@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110HK2PR03MB4580apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW50b24sDQoNClRoYW5rcyB5b3VyIGhlbHAgYW5kIHN1cHBvcnQuDQpJ4oCZdmUgZm9sbG93
ZWQgeW91ciBzdWdnZXN0aW9uIHRvIGVuYWJsZSBzZWxpbnV4IGtlcm5lbCBjb25maWd1cmF0aW9u
IGFuZCBoYXZlIHNlZW4ga2VybmVsIG1lc3NhZ2Ug4oCcWyAwLjAwMjI2OF0gU0VMaW51eDogIElu
aXRpYWxpemluZy7igJ0gZHVyaW5nIGJvb3QgdGltZSwgYnV0IHN0aWxsIHJldHVybnMg4oCcRGlz
YWJsZWTigJ0gYWZ0ZXIgZXhlY3V0aW5nIGdldGVuZm9yY2UgY29tbWFuZC4NClRoZSBzZWxpbnV4
IG1vZGUgYW5kIHR5cGUgSSBzZXQgaW4gL2V0Yy9zZWxpbnV4L2NvbmZpZyBmaWxlIGlzIHBlcm1p
c3NpdmUgYW5kIG1pbmltdW0uICBDb3VsZCB5b3UgaGVscCB0byBhZHZpc2UgbWUgd2hldGhlciB0
aGVyZeKAmXMgc29tZSBzZXR0aW5ncyBuZWVkIHRvIHNldCB0byBhdm9pZCB0aGlzIHByb2JsZW0u
DQoNClRoYW5rcywNCkl2YW4NCkZyb206IEFudG9uIEthY2hhbG92IDxybm91c2VAZ29vZ2xlLmNv
bT4NClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDMsIDIwMjAgMzo1MCBBTQ0KVG86IEl2YW4gTGkx
MSA8cmxpMTFAbGVub3ZvLmNvbT4NCkNjOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1
PjsgQXJ0ZW0gU2VuaWNoZXYgPGFydGVtc2VuQGdtYWlsLmNvbT47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KU3ViamVjdDogUmU6IFtFeHRlcm5hbF0gUmU6IFNFTGludXggc3VwcG9ydCBxdWVz
dGlvbg0KDQpIZWxsbywgSXZhbi4NCg0KUGVyaGFwcywgeW91IHNob3VsZCBlbmFibGUgc2VsaW51
eCBrZXJuZWwgY29uZmlndXJhdGlvbiBhcyB3ZWxsLiBUaGUgb3BlbmJtYyBrZXJuZWxzLCBpZiBJ
J20gbm90IG1pc3Rha2VuLCBoYXZlIGRpZmZlcmVudCByZWNpcGVzLg0KDQpUaGUgZGVmYXVsdCBj
b25maWd1cmF0aW9uIHJlbGllcyBvbiBsaW51eC15b2N0byBwYWNrYWdlOg0KaHR0cDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1zZWxpbnV4L3RyZWUvcmVjaXBlcy1r
ZXJuZWwvbGludXgNCg0KWW91IHNob3VsZCBpbmNsdWRlIHRoaXMgc2VsaW51eC5jZmcgaW4gb24g
b2YgdGhlIG9wZW5ibWMga2VybmVsIGxheWVyczoNCg0KU1JDX1VSSSArPSAiZmlsZTovL3NlbGlu
dXguY2ZnIg0KDQphbmQgY29weSBzZWxpbnV4LmNmZyB0byBvbmUgb2YgdGhlIGxvY2FsIGZpbGVz
IGxvY2F0aW9uLg0KDQpPbiBNb24sIDIgTm92IDIwMjAgYXQgMTg6NDYsIEl2YW4gTGkxMSA8cmxp
MTFAbGVub3ZvLmNvbTxtYWlsdG86cmxpMTFAbGVub3ZvLmNvbT4+IHdyb3RlOg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWou
aWQuYXU8bWFpbHRvOmFuZHJld0Bhai5pZC5hdT4+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIg
MiwgMjAyMCA4OjU0IEFNDQo+IFRvOiBBcnRlbSBTZW5pY2hldiA8YXJ0ZW1zZW5AZ21haWwuY29t
PG1haWx0bzphcnRlbXNlbkBnbWFpbC5jb20+PjsgSXZhbiBMaTExIDxybGkxMUBsZW5vdm8uY29t
PG1haWx0bzpybGkxMUBsZW5vdm8uY29tPj4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZzxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxd
IFJlOiBTRUxpbnV4IHN1cHBvcnQgcXVlc3Rpb24NCj4NCj4NCj4NCj4gT24gRnJpLCAzMCBPY3Qg
MjAyMCwgYXQgMTY6MjUsIEFydGVtIFNlbmljaGV2IHdyb3RlOg0KPiA+IEhpIEl2YW4sDQo+ID4N
Cj4gPiBZb2N0byBoYXMgYSBsYXllciBmb3IgU0VMaW51eA0KPiA+IChodHRwOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLXNlbGludXgpLCB5b3UgY2FuIHRyeQ0KPiA+
IGl0Lg0KPiA+IEJ1dCB0aGUgbGF5ZXIgZGVwZW5kcyBvbiBQeXRob24gZm9yIG1hbmFnZW1lbnQg
dG9vbHMsIHdoaWNoIGRvZXMgbm90DQo+ID4gZXhpc3QgaW4gdGhlIE9wZW5CTUMgaW1hZ2UgYW55
bW9yZS4NCj4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0IFB5dGhvbiBzaWduaWZpY2FudGx5IGluY3Jl
YXNlcyBpbWFnZSBzaXplLCBpdCB3aWxsDQo+ID4gYmUgbW9yZSB0aGFuIDMyTWlCLCB3aGljaCBj
YXVzZXMgc29tZSB0cm91YmxlcyB3aXRoIHFlbXUgZW11bGF0aW9uLg0KPg0KPiBUaGUgcHJvYmxl
bSBpcyBicm9hZGVyIHRoYW4gcWVtdSB0aG91Z2gsIGl0IHdvdWxkIGFsc28gYmUgYnJva2VuIG9u
IGFueQ0KPiBwbGF0Zm9ybSBzaGlwcGluZyBhIDMyTWlCIGZsYXNoIHBhcnQgaWYgdGhlIGltYWdl
IGV4Y2VlZHMgMzJNaUIuDQo+DQo+IFRoYXQgc2FpZCwgaWYgdGhlcmUgYXJlIHN5c3RlbXMgdGhh
dCBzaGlwIGJpZ2dlciBwYXJ0cyBhbmQgZW5hYmxpbmcgU0VMaW51eCBmb3INCj4gdGhvc2UgaXMg
ZmVhc2libGUsIHdlIHNob3VsZCBhZGQgdGhvc2UgcGxhdGZvcm0gbW9kZWxzIHRvIHFlbXUgc28g
ZW11bGF0aW5nDQo+IHRoZW0gaXNuJ3QgY29uc3RyYWluZWQgYnkgdGhlIGV4aXN0aW5nIHBsYXRm
b3JtIHN1cHBvcnQuDQo+DQo+IEFuZHJldw0KDQpIaSBBbmRyZXcgYW5kIEFydGVtLA0KUGVyIHlv
dXIgc3VnZ2VzdGlvbiwgSSB0cnkgdG8gZW5hYmxlIFNFTGludXggd2l0aCBZb2N0byBTRUxpbnV4
IGxheWVyKGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtc2Vs
aW51eCkgYW5kIDY0TWlCIGZsYXNoIHBhcnQuDQpCdXQgZW5jb3VudGVyZWQgb25lIHByb2JsZW0g
d2hpY2ggaXMgd2hlbiBJIHVzZSBjb21tYW5kICJnZXRlbmZvcmNlIiB0byBjaGVjayBTRUxpbnV4
IG1vZGUsIGl0IGFsd2F5cyByZXR1cm5zICJEaXNhYmxlZCIgZXZlbiBpZiBTRUxpbnV4IG1vZGUg
aW4gY29uZmlnIGZpbGUgJy9ldGMvc2VsaW51eC9jb25maWcnIGlzIHBlcm1pc3NpdmUgb3IgZW5m
b3JjaW5nIGJ5IGRlZmF1bHQuDQoNClBsZWFzZSBoZWxwIHRvIGFkdmlzZSBpdC4NCg==

--_000_HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110HK2PR03MB4580apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5paw57Sw5piO6auUOw0KCXBhbm9zZS0xOjIgMiA1IDAgMCAwIDAgMCAwIDA7fQ0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOaWsOe0
sOaYjumrlCI7DQoJcGFub3NlLTE6MiAxIDYgMSAwIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZp
bml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXtt
YXJnaW46MGNtOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0K
CWZvbnQtZmFtaWx5OiLmlrDntLDmmI7pq5QiLHNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBl
cmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNv
cmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpw
ZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xv
cjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1v
bmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0
aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIuMHB0IDkwLjBwdCA3Mi4w
cHQgOTAuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+
PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9
ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBt
c28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0
PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0K
PC9oZWFkPg0KPGJvZHkgbGFuZz0iWkgtVFciIGxpbms9ImJsdWUiIHZsaW5rPSJwdXJwbGUiPg0K
PGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxh
bmc9IkVOLVVTIiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj5IaSBBbnRvbiw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssc2Fucy1zZXJpZiI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxp
YnJpJnF1b3Q7LHNhbnMtc2VyaWYiPlRoYW5rcyB5b3VyIGhlbHAgYW5kIHN1cHBvcnQuPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMi
IHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPknigJl2
ZSBmb2xsb3dlZCB5b3VyIHN1Z2dlc3Rpb24gdG8gZW5hYmxlIHNlbGludXgga2VybmVsIGNvbmZp
Z3VyYXRpb24gYW5kIGhhdmUgc2VlbiBrZXJuZWwgbWVzc2FnZSDigJxbIDAuMDAyMjY4XSBTRUxp
bnV4OiZuYnNwOyBJbml0aWFsaXppbmcu4oCdIGR1cmluZyBib290IHRpbWUsIGJ1dCBzdGlsbCBy
ZXR1cm5zIOKAnERpc2FibGVk4oCdDQogYWZ0ZXIgZXhlY3V0aW5nIGdldGVuZm9yY2UgY29tbWFu
ZC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5n
PSJFTi1VUyIgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJp
ZiI+VGhlIHNlbGludXggbW9kZSBhbmQgdHlwZSBJIHNldCBpbiAvZXRjL3NlbGludXgvY29uZmln
IGZpbGUgaXMgcGVybWlzc2l2ZSBhbmQgbWluaW11bS4gJm5ic3A7Q291bGQgeW91IGhlbHAgdG8g
YWR2aXNlIG1lIHdoZXRoZXIgdGhlcmXigJlzIHNvbWUgc2V0dGluZ3MgbmVlZCB0byBzZXQgdG8g
YXZvaWQgdGhpcyBwcm9ibGVtLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90
O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1mYW1p
bHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj5JdmFuPG86cD48L286cD48L3NwYW4+
PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVw
dDtwYWRkaW5nOjBjbSAwY20gMGNtIDQuMHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6
bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwY20gMGNt
IDBjbSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IEFudG9u
IEthY2hhbG92ICZsdDtybm91c2VAZ29vZ2xlLmNvbSZndDsNCjxicj4NCjxiPlNlbnQ6PC9iPiBU
dWVzZGF5LCBOb3ZlbWJlciAzLCAyMDIwIDM6NTAgQU08YnI+DQo8Yj5Ubzo8L2I+IEl2YW4gTGkx
MSAmbHQ7cmxpMTFAbGVub3ZvLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IEFuZHJldyBKZWZmZXJ5
ICZsdDthbmRyZXdAYWouaWQuYXUmZ3Q7OyBBcnRlbSBTZW5pY2hldiAmbHQ7YXJ0ZW1zZW5AZ21h
aWwuY29tJmd0Ozsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPGJyPg0KPGI+U3ViamVjdDo8L2I+
IFJlOiBbRXh0ZXJuYWxdIFJlOiBTRUxpbnV4IHN1cHBvcnQgcXVlc3Rpb248bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFu
Zz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+SGVsbG8sIEl2YW4uPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+UGVyaGFwcywgeW91IHNob3VsZCBlbmFibGUgc2Vs
aW51eCBrZXJuZWwgY29uZmlndXJhdGlvbiBhcyB3ZWxsLiBUaGUgb3BlbmJtYyBrZXJuZWxzLCBp
ZiBJJ20gbm90IG1pc3Rha2VuLCBoYXZlIGRpZmZlcmVudCByZWNpcGVzLjxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9
IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+VGhlIGRlZmF1bHQgY29uZmlndXJh
dGlvbiByZWxpZXMgb24gbGludXgteW9jdG8gcGFja2FnZTo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+
PGEgaHJlZj0iaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1z
ZWxpbnV4L3RyZWUvcmVjaXBlcy1rZXJuZWwvbGludXgiPmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0
Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtc2VsaW51eC90cmVlL3JlY2lwZXMta2VybmVsL2xpbnV4
PC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+WW91
IHNob3VsZCBpbmNsdWRlIHRoaXMgc2VsaW51eC5jZmcgaW4gb24gb2YgdGhlIG9wZW5ibWMga2Vy
bmVsIGxheWVyczo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4t
VVMiPlNSQ19VUkkmbmJzcDsrPSAmcXVvdDs8YSBocmVmPSJmaWxlOi8vc2VsaW51eC5jZmciPmZp
bGU6Ly9zZWxpbnV4LmNmZzwvYT4mcXVvdDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gbGFuZz0iRU4tVVMiPmFuZCBjb3B5IHNlbGludXguY2ZnIHRvIG9uZSBvZiB0aGUgbG9j
YWwgZmlsZXMgbG9jYXRpb24uPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxh
bmc9IkVOLVVTIj5PbiBNb24sIDIgTm92IDIwMjAgYXQgMTg6NDYsIEl2YW4gTGkxMSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJsaTExQGxlbm92by5jb20iPnJsaTExQGxlbm92by5jb208L2E+Jmd0OyB3
cm90ZTo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHN0eWxlPSJi
b3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRpbmc6MGNtIDBj
bSAwY20gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBjbSI+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PGJyPg0KJmd0OyAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLTxicj4NCiZndDsgRnJvbTogQW5kcmV3IEplZmZlcnkgJmx0OzxhIGhyZWY9
Im1haWx0bzphbmRyZXdAYWouaWQuYXUiIHRhcmdldD0iX2JsYW5rIj5hbmRyZXdAYWouaWQuYXU8
L2E+Jmd0Ozxicj4NCiZndDsgU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyLCAyMDIwIDg6NTQgQU08
YnI+DQomZ3Q7IFRvOiBBcnRlbSBTZW5pY2hldiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFydGVtc2Vu
QGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmFydGVtc2VuQGdtYWlsLmNvbTwvYT4mZ3Q7OyBJ
dmFuIExpMTEgJmx0OzxhIGhyZWY9Im1haWx0bzpybGkxMUBsZW5vdm8uY29tIiB0YXJnZXQ9Il9i
bGFuayI+cmxpMTFAbGVub3ZvLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyBDYzogPGEgaHJlZj0ibWFp
bHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPm9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZzwvYT48YnI+DQomZ3Q7IFN1YmplY3Q6IFtFeHRlcm5hbF0gUmU6IFNFTGlu
dXggc3VwcG9ydCBxdWVzdGlvbjxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4N
CiZndDsgT24gRnJpLCAzMCBPY3QgMjAyMCwgYXQgMTY6MjUsIEFydGVtIFNlbmljaGV2IHdyb3Rl
Ojxicj4NCiZndDsgJmd0OyBIaSBJdmFuLDxicj4NCiZndDsgJmd0Ozxicj4NCiZndDsgJmd0OyBZ
b2N0byBoYXMgYSBsYXllciBmb3IgU0VMaW51eDxicj4NCiZndDsgJmd0OyAoPGEgaHJlZj0iaHR0
cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1zZWxpbnV4IiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0
YS1zZWxpbnV4PC9hPiksIHlvdSBjYW4gdHJ5PGJyPg0KJmd0OyAmZ3Q7IGl0Ljxicj4NCiZndDsg
Jmd0OyBCdXQgdGhlIGxheWVyIGRlcGVuZHMgb24gUHl0aG9uIGZvciBtYW5hZ2VtZW50IHRvb2xz
LCB3aGljaCBkb2VzIG5vdDxicj4NCiZndDsgJmd0OyBleGlzdCBpbiB0aGUgT3BlbkJNQyBpbWFn
ZSBhbnltb3JlLjxicj4NCiZndDsgJmd0OyBUaGUgcHJvYmxlbSBpcyB0aGF0IFB5dGhvbiBzaWdu
aWZpY2FudGx5IGluY3JlYXNlcyBpbWFnZSBzaXplLCBpdCB3aWxsPGJyPg0KJmd0OyAmZ3Q7IGJl
IG1vcmUgdGhhbiAzMk1pQiwgd2hpY2ggY2F1c2VzIHNvbWUgdHJvdWJsZXMgd2l0aCBxZW11IGVt
dWxhdGlvbi48YnI+DQomZ3Q7IDxicj4NCiZndDsgVGhlIHByb2JsZW0gaXMgYnJvYWRlciB0aGFu
IHFlbXUgdGhvdWdoLCBpdCB3b3VsZCBhbHNvIGJlIGJyb2tlbiBvbiBhbnk8YnI+DQomZ3Q7IHBs
YXRmb3JtIHNoaXBwaW5nIGEgMzJNaUIgZmxhc2ggcGFydCBpZiB0aGUgaW1hZ2UgZXhjZWVkcyAz
Mk1pQi48YnI+DQomZ3Q7IDxicj4NCiZndDsgVGhhdCBzYWlkLCBpZiB0aGVyZSBhcmUgc3lzdGVt
cyB0aGF0IHNoaXAgYmlnZ2VyIHBhcnRzIGFuZCBlbmFibGluZyBTRUxpbnV4IGZvcjxicj4NCiZn
dDsgdGhvc2UgaXMgZmVhc2libGUsIHdlIHNob3VsZCBhZGQgdGhvc2UgcGxhdGZvcm0gbW9kZWxz
IHRvIHFlbXUgc28gZW11bGF0aW5nPGJyPg0KJmd0OyB0aGVtIGlzbid0IGNvbnN0cmFpbmVkIGJ5
IHRoZSBleGlzdGluZyBwbGF0Zm9ybSBzdXBwb3J0Ljxicj4NCiZndDsgPGJyPg0KJmd0OyBBbmRy
ZXc8YnI+DQo8YnI+DQpIaSBBbmRyZXcgYW5kIEFydGVtLDxicj4NClBlciB5b3VyIHN1Z2dlc3Rp
b24sIEkgdHJ5IHRvIGVuYWJsZSBTRUxpbnV4IHdpdGggWW9jdG8gU0VMaW51eCBsYXllcig8YSBo
cmVmPSJodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLXNlbGlu
dXgiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0
LmNnaS9tZXRhLXNlbGludXg8L2E+KSBhbmQgNjRNaUIgZmxhc2ggcGFydC48YnI+DQpCdXQgZW5j
b3VudGVyZWQgb25lIHByb2JsZW0gd2hpY2ggaXMgd2hlbiBJIHVzZSBjb21tYW5kICZxdW90O2dl
dGVuZm9yY2UmcXVvdDsgdG8gY2hlY2sgU0VMaW51eCBtb2RlLCBpdCBhbHdheXMgcmV0dXJucyAm
cXVvdDtEaXNhYmxlZCZxdW90OyBldmVuIGlmIFNFTGludXggbW9kZSBpbiBjb25maWcgZmlsZSAn
L2V0Yy9zZWxpbnV4L2NvbmZpZycgaXMgcGVybWlzc2l2ZSBvciBlbmZvcmNpbmcgYnkgZGVmYXVs
dC48YnI+DQo8YnI+DQpQbGVhc2UgaGVscCB0byBhZHZpc2UgaXQuJm5ic3A7IDxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110HK2PR03MB4580apcp_--
