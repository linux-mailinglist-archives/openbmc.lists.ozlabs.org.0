Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E82136D02F
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 03:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVLKY0DcJz2yy4
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 11:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=bxfD0SEN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.98;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=bxfD0SEN; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310098.outbound.protection.outlook.com [40.107.131.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVLKD6m8Tz2y81
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 11:15:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmuwi0umkFlX8m9WI1zTGdbfdnzLBWJfkDtoUyAANlauaFanGUYFGdzHUHINnEMtmEbOv5QanDyqtpVuWatG8Nkmm9BL61YSPiQhc3//7wFncIVikOCf/BlEcN7/qGsgUuxzIIeWIWkQ3qJIjx6g+Z6sAOW1p3yzRUJn9QlsFOXWDhkX9jMbqk7niPrqxAigXMAj7B3D/NwgNPYBSHM0DNmjmz4D+oAOv46WiRTszhEHRxu9BHNEkc7IiVTIIWIpwN+YXwMm2l1+u/o/hur5mfLNYWChi5pcR5za7gzBDikECVg0H6DgHPW148LFgY5n6oE+sAW+btOvuaxHyitpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ2MeMs4amtx4x1q8GLHJ1Yt3bOUZjXqCAkWG8FulRA=;
 b=OU8cLw98gKsW/BZMsyVEGZ5Hove+LzIkbz18iOL6F7SPL7T3PM9Y3/sQady+3/pK4hm3+tRjaWR48wlrIOMGq1nVDbLJjYGQMcgptjnDuyhOWO6KYjJxsdZAQJKs2KgIySvSxLxtBTg7ilybNhnZepOm1MHVpK1rrGmbMG9nYwNh4NeshlXy9MwZ7k6W8VZYu4l+WhcacAVn8+5pdnNbbXuCzAMhZeDcCPMFyN+EWwtrYynSnLVurmSMx1HEaFn511KSwLYWy8cPitBOs0hWx7ln5IRYqVM0iFJig7JMrtAe4n8z5q0AfBiUN8OzdG8/1p4+ZMm1azYLBJ4BF3hXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJ2MeMs4amtx4x1q8GLHJ1Yt3bOUZjXqCAkWG8FulRA=;
 b=bxfD0SENc4Iqo9BbAa4wtBnsO2N8vDQtvH9Q5AI1eyMn9iz3Va4xRNFG7b66JJi1Sk+3Gl5D7KpnzF5lK1jQSiMEP38d+ZeQAM3F53bEpUSRfGoRw3d7XHC2vpUDdgJh0hOhFVr1nJavYNRkDWB0OvRa7f6Hse07dSYwxlp1iNE=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB3089.apcprd04.prod.outlook.com (2603:1096:203:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 01:15:04 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 01:15:04 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [Kernel] Nuvoton NPCM7xx unbind FIU issue
Thread-Topic: [Kernel] Nuvoton NPCM7xx unbind FIU issue
Thread-Index: Adc7yulaJSnuzQhKT6+mrR40GddPjQ==
Date: Wed, 28 Apr 2021 01:15:04 +0000
Message-ID: <HK0PR04MB233983F380954AF58F9898208F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3eb39570-a087-42a4-3482-08d909e30dfc
x-ms-traffictypediagnostic: HK0PR04MB3089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB3089FDFA6FFB6A9DF9D05E518F409@HK0PR04MB3089.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mmgOjA34BkG13DtftzXrDELQKU/v9ltR0uosgbI1WNuR09QHl7GSA7e7zDvTxmOe3kq9XKbJamvOWMyP2TdK1ivciTInOVHvR9CaJxM8j4XZPXdI8a7KvKUTHc1ahBjMMRAYhC0dFapwEGnye+wo5sapD7jhsxgoITtRvffsBi29G+trM0+L/gx5Nx2vmAMC+svklZhEUVObT9tqH2kdnGK9XBdxOYj2WWYxMtDjOuTkJKOlkfzwZg494QXgf6y8CJRtdmLWyqZ1uDAFm80NoX6HoWIiRFKWSAPJWWgKC3EvIsVcJ8Lq+c62kziWxHC+SuhWXVt2GAisxeb2KvlulL/SXke2VgADXXVtAy88YxbXJy7lMhhEuPFjdMMX4gW6JE3usD7zuT884vz0dsv7iz8SgnTprUNX2f5yv6SwracI8x8Lx7rD3LemPRtBRi7JYcHzw9dj9qkannkCH1J6dRvFIcBd1w5nf05AZ5Hgb3lRqIaNo4VdhIN5UuRKfHwjB5DFFC3zpzlhigtQKg+SEkZuCjEdVSLFhJpwH4yQxbXwTurnGzjxDoyix/0nlUWAceGugEd32xJqe05ZxBtznTVFAM08ISTadePcdaNQoABdD8XBsFf+u7ykgk7eHD6FrCuiaeDbCRGM/ztv1pJgN805+5ogBJkXuR4OeXcDmWcR98EOXQPeod7kyy5B0EdY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(966005)(478600001)(8936002)(52536014)(8676002)(86362001)(54906003)(55016002)(71200400001)(110136005)(186003)(316002)(9686003)(45080400002)(5660300002)(6506007)(26005)(107886003)(33656002)(66476007)(2906002)(85182001)(83380400001)(38100700002)(122000001)(64756008)(66446008)(66556008)(76116006)(4326008)(66946007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?S2VKbXJGWlBPZ2dmOHhQU0ZCNzdIc3krMUFWR0l2cnlIS3dBRHpaTVRkemtiZGZo?=
 =?big5?B?anp3YnREcHZqWnVEb1paRDczMHNsQS9hN25vRnoydDBrcmU2RWdaYi9ZeWtDeGtC?=
 =?big5?B?SWR2cTBubllhODhIOEJvUldVUHd1R0E1ekJwd0FHS3FkblBVWUhFZW11UU5jSGQ5?=
 =?big5?B?aTFzbk9DRW9CeE1zdXRpV2pwZXhYbDNxSkFUbjZzekR4bUdLbVEwaUFPVnMzMUgv?=
 =?big5?B?VUxmZVV2dnpCczczakRYUnh2ZllQWEVvekhvNFR4RFh1VVNDZGtRTHV0Q0pmV2ov?=
 =?big5?B?bHVwRXdLaUtyazJ3bmZzVXF6MDd3QTVpS0UrQlA3WnRGWlg0anAxNm9xb1MvQjQv?=
 =?big5?B?RVVXZEp3dm90VEk0Nkc0WjNsTkNCRjdHMzc4VWYxaHpia2dDdHFQa0FBRk5WMHI5?=
 =?big5?B?Z1NQWGpLWC8wSTFwN2hrTGFBVXhWZHJIeUQrWTQvL2NCTnRWYUYyb3N2VytocnVw?=
 =?big5?B?UzFFemRiY0F0SmtwbStkWDdhaHJlOHUybE90d3YyMUhLQStzaW9mclRveTJNc0V5?=
 =?big5?B?cmxSUVh0dGFxQkJtN1RwblJMMmdNSmpKYnNQb2pmRWcrNUhUS0RVQWVPYTlIeWJy?=
 =?big5?B?WDc2ZDJTN0RJandqWHQxRHZPODZWZ0N4RDRuUjV5WWxkYnprZHpHRVhDQjNvME1k?=
 =?big5?B?OEJHNFQ3WVZ4RHFjSXprTm5PL0V3RFhHNi9ZVC9RWkpwUDVJQW1kODBUZURIVnJv?=
 =?big5?B?bno0VlpnV1RoVU5Xd0dmMHlrbFMzcnlPbzc3eDBoVFhkcGozZlpHeEVOSVNaUXBr?=
 =?big5?B?WS92aXRyNkNFZlJVejdNODFVRDA5WHdzMzA4R0t1Yzd5YTZxR1VPai8zak82M3NJ?=
 =?big5?B?VEkzMW5EbUdGYVlTNEJReTFQUm5ia3FSenFneWFna1RQSjVtQ2Q5enFpTjJUTk4v?=
 =?big5?B?aXVKL2UzbDRNdWE3RlFLclFxRVBUVkw1NWFqKzJoTkJHbmViNEFhZFZjdEo3QlJt?=
 =?big5?B?Tm0ralB2ZVY5eXUxYW5kRCtVUGJ1di9vS043NEw5Ly9LTlpZeGF5OGRkUzA0Z0Jt?=
 =?big5?B?QkNZQXdub1lCZjlEQmRqd0RDUThKL0lIVElyazFHTUZTdmE3RldLaVJFYlNoSlA2?=
 =?big5?B?NmlISVFmY0hJZ2ZYWERQWHhBcEE3aVRFSnhrY2tIMU5TV0dSYm0rSG5ZaUN6RnFj?=
 =?big5?B?bWxVenMrRlNlbEIyc0VyM1VESjNhSmQ0N3ZmU0MzR0x5elprYmowTjVPVncydFJq?=
 =?big5?B?TnlvRmdUcjg1YWRrWVFtZW9sUTNVUG9TM3piTVU5eUdqNVFIYUV4MWxoU3Q0eHlI?=
 =?big5?B?YWRMQ0JwQlZDM3VmMUZUaXpGWDhNT0ZzdWRhcW8zaHpRSmpmK2p1MGhJeGgwQko2?=
 =?big5?B?YjlxcXVGWXNZTENUeG9JQnpyblFUZHkwbzBsUjBpcU56MEdjclhsR3JIUnM0Znhm?=
 =?big5?B?YmY4NXgybzYyYjhRN3VFUXBVUzYrQm93L3FJSWFYWFM1S2kwd205VVdFN2ZTYng3?=
 =?big5?B?RURGeW41OXZJUEorRDNFWTBkZ0YrelpLenpBR2lyY0hmNGlKQUk5b2J1WjA3a3pX?=
 =?big5?B?eEVnUnZreFZFbkxrL3R4ckpXZHRYQXJwajVnS2dhd2tLNnFWQlpYcDFFOXdJejNo?=
 =?big5?B?a3dWdkYvVEFZQnVZQUh1aEJ0NHVJVC8vL1oxK1MyN0xFSFg0NGNRWWMwZnVtQWVD?=
 =?big5?Q?a+pbFhoweEFobJ+ha3ddc/Z96cr88NaFQiFv8opFDquyPmXc?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb39570-a087-42a4-3482-08d909e30dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 01:15:04.4685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvGEq8EIfPgFPEt6UyhpT1eCNtVra/H+XpclaWvvuXopA7cmd/savI2huz8kSo4+3SIzSggHiRkXXD/wdzsFts/1PZjRmVLIEv0B6sA8Gl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3089
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
Cc: Brandon Kim <brandonkim@google.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KRm9yIGtlcm5lbCB2NS54LCB3ZSBmb3VuZCB0aGF0IHdoZW4gd2UgdW5iaW5k
IEZJVSBtb2R1bGUgYXQgdGhlIGZpcnN0IHRpbWUsIGl0IHdvdWxkIGNhdXNlIGtlcm5lbCB3YXJu
aW5nIGxpa2UgdGhhdDoNCg0KLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQpX
QVJOSU5HOiBDUFU6IDAgUElEOiAyMTc0IGF0IGxpYi9yZWZjb3VudC5jOjE5MCByZWZjb3VudF9z
dWJfYW5kX3Rlc3RfY2hlY2tlZCsweDYwLzB4YmMNCnJlZmNvdW50X3Q6IHVuZGVyZmxvdzsgdXNl
LWFmdGVyLWZyZWUuDQpNb2R1bGVzIGxpbmtlZCBpbjoNCkNQVTogMCBQSUQ6IDIxNzQgQ29tbTog
Z2JzLXN5c2luaXQuc2ggTm90IHRhaW50ZWQgNS40LjgwLWViYWQ4Y2QtZGlydHktYzQ2NDQ0ZCAj
MSBIYXJkd2FyZSBuYW1lOiBOUENNN1hYIENoaXAgZmFtaWx5DQpCYWNrdHJhY2U6DQpbPGIwMTA3
YzZjPl0gKGR1bXBfYmFja3RyYWNlKSBmcm9tIFs8YjAxMDgyNzg+XSAoc2hvd19zdGFjaysweDIw
LzB4MjQpIHI3OjAwMDAwMGJlIHI2OjYwMDAwMDEzIHI1OjAwMDAwMDAwIHI0OmIwYjVjMWQ4IFs8
YjAxMDgyNTg+XQ0KKHNob3dfc3RhY2spIGZyb20gWzxiMDc5Njk1MD5dIChkdW1wX3N0YWNrKzB4
OTQvMHhhOCkgWzxiMDc5NjhiYz5dDQooZHVtcF9zdGFjaykgZnJvbSBbPGIwMTE3NTVjPl0gKF9f
d2FybisweGVjLzB4MTA4KSAgcjc6MDAwMDAwYmUgcjY6YjA0MjllYWMgcjU6MDAwMDAwMDkgcjQ6
YjA5MmM2MDQgWzxiMDExNzQ3MD5dIChfX3dhcm4pIGZyb20gWzxiMDExNzkyND5dICh3YXJuX3Ns
b3dwYXRoX2ZtdCsweGE4LzB4Y2MpICByNzpiMDQyOWVhYyByNjowMDAwMDBiZQ0KcjU6YjA5MmM2
MDQgcjQ6YjA5MmM2NzAgWzxiMDExNzg4MD5dICh3YXJuX3Nsb3dwYXRoX2ZtdCkgZnJvbSBbPGIw
NDI5ZWFjPl0NCihyZWZjb3VudF9zdWJfYW5kX3Rlc3RfY2hlY2tlZCsweDYwLzB4YmMpDQogcjg6
MDAwMDAwMGEgcjc6ZWVhNDRjMTAgcjY6ZWJmYzdlMDQgcjU6ZWVkY2Y4MDAgcjQ6MDAwMDAwMDAg
WzxiMDQyOWU0Yz5dIChyZWZjb3VudF9zdWJfYW5kX3Rlc3RfY2hlY2tlZCkgZnJvbSBbPGIwNDI5
ZjIwPl0NCihyZWZjb3VudF9kZWNfYW5kX3Rlc3RfY2hlY2tlZCsweDE4LzB4MWMpDQogcjU6ZWVk
Y2Y4MDAgcjQ6ZWVkZGQ4MDANCls8YjA0MjlmMDg+XSAocmVmY291bnRfZGVjX2FuZF90ZXN0X2No
ZWNrZWQpIGZyb20gWzxiMDc5YzEzND5dDQooa29iamVjdF9wdXQrMHg1MC8weDY4KQ0KWzxiMDc5
YzBlND5dIChrb2JqZWN0X3B1dCkgZnJvbSBbPGIwNGI1NmE4Pl0gKHB1dF9kZXZpY2UrMHgyMC8w
eDI0KQ0KIHI0OmVlZGNmNzgwDQpbPGIwNGI1Njg4Pl0gKHB1dF9kZXZpY2UpIGZyb20gWzxiMDUx
OWYzYz5dDQooZGV2bV9zcGlfcmVsZWFzZV9jb250cm9sbGVyKzB4MjQvMHgyOCkNCls8YjA1MTlm
MTg+XSAoZGV2bV9zcGlfcmVsZWFzZV9jb250cm9sbGVyKSBmcm9tIFs8YjA0YzA4YjA+XQ0KKHJl
bGVhc2Vfbm9kZXMrMHg4NC8weGM0KQ0KWzxiMDRjMDgyYz5dIChyZWxlYXNlX25vZGVzKSBmcm9t
IFs8YjA0YzE3YzQ+XQ0KKGRldnJlc19yZWxlYXNlX2FsbCsweDVjLzB4NjApDQogcjg6ZWVhM2Iy
NTQgcjc6YjBiNDNmYzAgcjY6ZWVhM2IyMTAgcjU6YjBiNDNmYzAgcjQ6ZWVhNDRjMTAgWzxiMDRj
MTc2OD5dIChkZXZyZXNfcmVsZWFzZV9hbGwpIGZyb20gWzxiMDRiYjU5Yz5dDQooX19kZXZpY2Vf
cmVsZWFzZV9kcml2ZXIrMHgxNWMvMHgyMTApDQogcjU6YjBiNDNmYzAgcjQ6ZWVhNDRjMTANCls8
YjA0YmI0NDA+XSAoX19kZXZpY2VfcmVsZWFzZV9kcml2ZXIpIGZyb20gWzxiMDRiYzhmND5dDQoo
ZGV2aWNlX2RyaXZlcl9kZXRhY2grMHg4NC8weGEwKQ0KIHI5OjAwMDAwMDAwIHI4OjAwMDAwMDAw
IHI3OmIwYjQzZmMwIHI2OmVlYTQ0YzU0IHI1OmVlYTNiMjEwDQpyNDplZWE0NGMxMCBbPGIwNGJj
ODcwPl0gKGRldmljZV9kcml2ZXJfZGV0YWNoKSBmcm9tIFs8YjA0YmE0ODA+XQ0KKHVuYmluZF9z
dG9yZSsweGU0LzB4ZjgpDQogcjc6YjBiNDNmYzAgcjY6MDAwMDAwMGQgcjU6ZWVhNDRjMTAgcjQ6
YjBiM2UyYjAgWzxiMDRiYTM5Yz5dDQoodW5iaW5kX3N0b3JlKSBmcm9tIFs8YjA0YjkzMjQ+XSAo
ZHJ2X2F0dHJfc3RvcmUrMHgzNC8weDQwKQ0KIHI3OmViZmM3ZjY4IHI2OmViYTI2NmMwIHI1OmVj
MGNmZTgwIHI0OmIwNGJhMzljIFs8YjA0YjkyZjA+XQ0KKGRydl9hdHRyX3N0b3JlKSBmcm9tIFs8
YjAyZGE2MTg+XSAoc3lzZnNfa2Zfd3JpdGUrMHg0OC8weDU0KQ0KIHI1OmVjMGNmZTgwIHI0OmIw
NGI5MmYwDQpbPGIwMmRhNWQwPl0gKHN5c2ZzX2tmX3dyaXRlKSBmcm9tIFs8YjAyZDk3MDQ+XQ0K
KGtlcm5mc19mb3Bfd3JpdGUrMHgxNTgvMHgyMzQpDQogcjU6ZWMwY2ZlODAgcjQ6MDAwMDAwMGQN
Cls8YjAyZDk1YWM+XSAoa2VybmZzX2ZvcF93cml0ZSkgZnJvbSBbPGIwMjUyN2I0Pl0NCihfX3Zm
c193cml0ZSsweDI4LzB4NDgpDQogcjEwOjAwMDAwMDA0IHI5OmViZmM2MDAwIHI4OjAwMDAwMDAw
IHI3OmViZmM3ZjY4IHI2OjAwMTNkNzQ4DQpyNTplYmY4NzQ4MCAgcjQ6YjAyZDk1YWMgWzxiMDI1
Mjc4Yz5dIChfX3Zmc193cml0ZSkgZnJvbSBbPGIwMjU0ZDNjPl0NCih2ZnNfd3JpdGUrMHhjNC8w
eDE4NCkNCiByNTplYmY4NzQ4MCByNDowMDAwMDAwZA0KWzxiMDI1NGM3OD5dICh2ZnNfd3JpdGUp
IGZyb20gWzxiMDI1NGZjOD5dIChrc3lzX3dyaXRlKzB4NzQvMHhlOCkNCiByODpiMDEwMTIwNCBy
NzowMDAwMDAwMCByNjowMDAwMDAwMCByNTplYmY4NzQ4MCByNDplYmY4NzQ4MCBbPGIwMjU0ZjU0
Pl0gKGtzeXNfd3JpdGUpIGZyb20gWzxiMDI1NTA1ND5dIChzeXNfd3JpdGUrMHgxOC8weDFjKQ0K
IHI3OjAwMDAwMDA0IHI2OjRmMDYzMDE4IHI1OjAwMTNkNzQ4IHI0OjAwMDAwMDBkIFs8YjAyNTUw
M2M+XQ0KKHN5c193cml0ZSkgZnJvbSBbPGIwMTAxMDAwPl0gKHJldF9mYXN0X3N5c2NhbGwrMHgw
LzB4NTQpIEV4Y2VwdGlvbg0Kc3RhY2soMHhlYmZjN2ZhOCB0byAweGViZmM3ZmYwKQ0KN2ZhMDog
ICAgICAgICAgICAgICAgICAgMDAwMDAwMGQgMDAxM2Q3NDggMDAwMDAwMDEgMDAxM2Q3NDgNCjAw
MDAwMDBkIDAwMDAwMDAwDQo3ZmMwOiAwMDAwMDAwZCAwMDEzZDc0OCA0ZjA2MzAxOCAwMDAwMDAw
NCBhNmZhZWY4MCA0ZjA2MzEzYyAwMDAwMDAwMA0KMDAwMDAwMDANCjdmZTA6IDAwMDAwMDBhIGFl
YWJiYjYwIDRlZjhjOTkwIDRlZmU3M2EwIC0tLVsgZW5kIHRyYWNlIGY5ZWNhNDBhY2IzNzk4MWQg
XS0tLQ0KDQoNCkFuZCB0aGVyZSdzIGEgZml4IG9uIGtlcm5lbCBnaXRodWIgZm9yIG5vdzogaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC83OTRhYWYwMTQ0NGQ0ZTc2NWUy
YjA2N2NiYTAxY2M2OWMxYzY4ZWQ5DQoNCkNvdWxkIHlvdSBoZWxwIHRvIHB1bGwgdGhpcyBmaXgg
dG8gY3VycmVudCBPcGVuQk1DIGtlcm5lbCByZXBvLiB0byBmaXggdGhpcyBpc3N1ZSA/DQoNClRo
YW5rcy4NCg0KQmVzdCBSZWdhcmRzIA0KR2VvcmdlIEh1bmcNCg0K
