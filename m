Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF84B601E
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 02:48:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyPBK0xyHz3c7S
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 12:48:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2IQTIPxP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::724;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=2IQTIPxP; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyP9j1Wd8z3bTd
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 12:47:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVJjBfal6MQh55l0qUXrftY/ssnBzKAx5Qi9C/JkJDQbWU1FWjMjyB/v+cq1+wJe9bRLY23bfmoXEBv/xw7Lhz9ETUn4pFsYg5WjVc3JIP9qjEtij4/lJ3ym6vBbVqSCDHuLSvtptLhOt6nj8s0ouWqfG1NHgM/Ma6Lc3lyZ1aloInYhRqTs1zma5apFPuvGGb1cuZwP6/3mgeQr9dSSjW3I7Afhq9CSHECcbWNTlyrEM66ry0TN8+OirrsvyXfuKvNQgKs+RI2WT2wtW2/BfD93Z55CpfFQ4WHMkkW1QvFnuY90Eqa5aq33/ebzTOZ0q7ZgSaE25jtTbMR8B2x8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e0H3itjYkmYTsExSdN0QOV+WKBl3+6PcuZDmhoTr+g=;
 b=AbhmaO6lflYmMU2HWTTGnOiq8FANnFSfKVvbYaTNBSbERW8WO6yC/EoEB+j+vb6aQuofO4hMTw8eXIEwM8RbOdpuyc3W4lDUHzW7Lmeoo+/vcgsi+p/FBnVZbfrDxingTkNkDLjzYRXlSupVPcRp+B9IqQcnWnA/fZysFQj5pyd7tpeYmDQePLcQkzqaqcsxQBwxLFtZpKt7ueXgP4EoIdIpW8Xpqq4TtKLNqwNLojlpl/oudjn2hvyk9uJsm9EYsphUKYIDbMzhsiZZunzs4yv7EibuksNLul5nyQG6gtQHkUlbVsSo2jH1Dg3CXa8smwvX9TzW5vIjKWZLGDUdSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e0H3itjYkmYTsExSdN0QOV+WKBl3+6PcuZDmhoTr+g=;
 b=2IQTIPxPKvJ3ViJAAMk4pm5PV3hWhIrRjN/5w2PUltCx8n2nBbE7JjH442xdodF5kpUVjoUP4y86S+huRl7tudaVlV9pHBwLSqmVGj8HHPEty7T1Nxt9b3c9BUeIXxphji37Xtmb+Y5MzFEsmESUPcqRW7feuDlvdKe/TOQdVWLcd/V5rolu4ppH/CUhFHWmAoUl+jxztErOsYWVic0D8DxVtf7r3BrMREwQ9m1i1r6dCguib4QMvlOxBdqz7892C2GHrC1D9QOZOJctCTQg8DeW9MpjAu8inrt9e2iydS46Jp4ZNDQChgevrJkL2w6b8KtLRwOmh9Ng+qct0KpqnQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by PSAPR06MB4871.apcprd06.prod.outlook.com (2603:1096:301:5b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 15 Feb
 2022 01:47:30 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::c4c2:84ad:81d1:e3e7%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:47:30 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Subject: RE: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Topic: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Index: AQHYG+hw8XtdMh+KHEiz91QkCChn7ayHqWgAgALWXJCAAyGzAIAGP/lA
Date: Tue, 15 Feb 2022 01:47:29 +0000
Message-ID: <HK0PR06MB37798E753FC015030DF2F9A991349@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
 <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <HK0PR06MB3779776EED65721E481F8676912E9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XfM+jNJ6bsABCPgGYWDg7bczjKKFjmA=Lzbi166nSOjbw@mail.gmail.com>
In-Reply-To: <CACPK8XfM+jNJ6bsABCPgGYWDg7bczjKKFjmA=Lzbi166nSOjbw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46cfe33d-6540-4d04-6586-08d9f02520a1
x-ms-traffictypediagnostic: PSAPR06MB4871:EE_
x-microsoft-antispam-prvs: <PSAPR06MB4871F700884BA48B16EA747491349@PSAPR06MB4871.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+uCDFFQA0O9nzBv8WmUo9YAD4AoOKQfmxSukZLDQiCJkz241CwLxSCVvNelrfAlkQ3HQGbORcPP2KL+zlPR+fH8uqKFIl6MrVUZsmCQgAyw+/eIKJqcCpn6pvrbt5W9GGUVLBBU/VFU0iv8FPLZcl9kNu3Nd2a2zv8gtpRpytT1c796E4BSPUVwbcmrDpHkTgYRGzRR513UgDk4D6wUlil4QCd4W2oKZ9xx2dm0lOrud8XMIq6ydEinVNnlrX/2sZXOxJlI51HM1VAaVtVK2qo7iWvfIxh1EED/wicfaSaDXGKRB60S9vLOnwyFZrSdEC4VBc/U3L3MPn3vG784y4TA5igt+wjJcpbWi8xay94OTQ/bndTCes42jlDAtEyoQlwJXo5vXQNSmxTtJYaTMOo95YTClVRBux4InegUiCDF61EKtBGQLYU9W6tXMAggNvO7K9fpgatlthSdwGDblvT8Oz24IhsQHLpLb83564O3GdJuG3M+MW/ZOWTYk6/XtHmJOavi/Ic0hII14yOkLLfAwK0UFd1MBvF+kDD7742QHUiVIHmaZhdhzcPe5stU+b8t4SqIP/VqHwtSyoWpYmXgLLP84KZlcvMOKFZ71bR5t7W2GBd5hNwzF9Z2fbgO6/en5dFAh8anremtBau5JlZ542d63Hs3jI4HLcyaWvsrAnPxFxZg4plk5ERHc0+9CooNlyFXvNC2bD6xnTe+pJ0hPcG5UyvTGp0T1IzjKcCjmsOduAnys3n2Ju8c5nxkB2aGrUiMgaXp4Qo+ZdeNkGrbixxXwZLc+mvUiwh4+mFODOn8jm2/6gSp+1VkJdEKLtzCKGi+eD/o0d8xCQoqvqutSFL1ou4g6TCxp99vYts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(376002)(396003)(39840400004)(346002)(136003)(76116006)(66946007)(6506007)(66476007)(8676002)(5660300002)(33656002)(7696005)(2906002)(9686003)(4326008)(66556008)(55016003)(966005)(110136005)(64756008)(54906003)(66446008)(71200400001)(122000001)(38070700005)(38100700002)(186003)(8936002)(52536014)(86362001)(508600001)(316002)(26005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2V0Z04zWVNSaC9YN0ZJTjJWL2J0YVVaNXVSZ2pmRS9NOHA4TDFYZUllQlZv?=
 =?utf-8?B?NHRSS2w1YUtJL0hDUFZhT3dPY0hremVTS0VTd3llRW1GbEY2ZmJNOGxNa3Ry?=
 =?utf-8?B?aW8wYnBtS1hNSlVrcU1iZm1aN1E3aVJ2c09RU0ZzbUQ1bnlWcmQ0Szk0b01Q?=
 =?utf-8?B?eU9nczh1Z3BHaWIveDhFcHBFaURaZTRia2E4Qkl4b3dqbFhRSWlmUlpkSzE5?=
 =?utf-8?B?R3BPRENoS3FKUGQzeGVHNHF1Z1RhSGtrY3F0TlZxb0tRL08remdWbEg4THVP?=
 =?utf-8?B?b0lYbjc2Q0VPaGx6Nm9zMWoyT2RsWU1OdFh0Vk5tVE1oczFYOGsvU2xZclJa?=
 =?utf-8?B?ZFBkY2xodWdHM05sRnZxdTVIUjVnOFl4U0xhREZodXpZYVBLZnZsK1BZWjNo?=
 =?utf-8?B?aitBWVFuQ2JyMVNHTEczV01kaW5lWlgrdTlnemR4YnUxMGkrdDBLRy9BcEtl?=
 =?utf-8?B?Umd6bnhYNEFVd2JxWTFFSzBCNW1qOGFyc0xWSVRjbzh2YVpZcFFiWHhDcitk?=
 =?utf-8?B?bndKZUJnandwUUZ2Umo1OUFBSzhTaDlyL3lJUFIzQ2MxbkluMElyNlpNaUtL?=
 =?utf-8?B?ZW9aZCtUdTZROWVObnRUZlhoVVZmbVN5MWd5UVRqcFUwQ3dIT2FsNzR1L094?=
 =?utf-8?B?YUpkRmVhN3Uxa1hjc1ZGbjBJaUc2UXRKMXA5Y045dlhiKzZyemR4MnFIRzdT?=
 =?utf-8?B?eW9XOGlHVDdWLzhwYjY3M0RhTXB6eUczSUR5ZXN6aWZnSXBpSVVoNEVnZHlR?=
 =?utf-8?B?Z0RDSCtxOE9XKzhnMHJLVUNmSHZXZUZYRzlESTcrSlhqN3prK0dKbXFBOG5o?=
 =?utf-8?B?bHcwSTdRRko1SzIwOGg0M0FWOWhFOHNXMEJLVkpVUEx6NDRDNHI1OTNHV0RO?=
 =?utf-8?B?UjQvTGRjSkxUWmxEUU9WY2lEOG40Q2lCTkJ3ZGtHRGNDdks1WWFYcEtJMFdk?=
 =?utf-8?B?b3lROTdyKzhVc2FlU2F3eEx0SDRGQ05MdERDSXhabEN1MGRZeVdiREVzNkU5?=
 =?utf-8?B?TUF0YTlZZnpYdWd1V3c4QStwVGJjbW1FL0lCYU13WHVTaUlnb0NHRy8rN3Q3?=
 =?utf-8?B?bm00QjNabXFPcm1MTmxaN0hhSnFic1RzcUFkdncxbzVvbkQyS3h2dU45bVJh?=
 =?utf-8?B?Y092YlY0V0F3MkhUNzFXYmF5NTB0MVp4ZmFOdnVCaUZlTzJOcUdRQmhkTUJ0?=
 =?utf-8?B?R3E1V24zNmtXZjNUVjkyWWlTbFBiVFIzN2VlYTVBSmtqWGxLYm9JZW9IU0dz?=
 =?utf-8?B?STRtMFVUOEhmVUJUbHdQTmFublBhYllYSjNJNlF3VWg1QS9KQ2V1YkUwVWFj?=
 =?utf-8?B?UExzNE8rWCt3amxtRnphaThkbVVOOEh1a3dyQWlaT2MzQnJtRDhGcklzSy91?=
 =?utf-8?B?T1phMFVUYTY1TGxFUHgvYytVdWlyS29KN2p2N2kvOEJtYzA5alQ1YVNVdHlt?=
 =?utf-8?B?N1RWQ3FBMURYTW9aYlhKYk5laXhrOUF1ZzVnZ0tSZzB5RzMvcjUzMzNWK2U0?=
 =?utf-8?B?SXBaaEtUaEh2Q24yaUNaemZCQno4enNqanVRb1RRSWZJK0d5Mzd4TmVvZ2xq?=
 =?utf-8?B?SW5hNllpWUJBWVd1RzBVLzNXK1dQMmJtRCtXUWYwSnRWOXRJdHFadzNvS2VD?=
 =?utf-8?B?ckVkSnJLaTkzb3NnSytaWjgxcktzcDVFU2xaTVhncTBxOE1DdXpUYkdlYVdC?=
 =?utf-8?B?ckRadWVRUG02QUxJSjFiWnp1bjMxMWVtdk5QdTZRemdMOEpFdzVLcktzcVpk?=
 =?utf-8?B?MmwxYjgrZEMvbWpwczQ0R2Q2TXNicmpjQW9kcjdHaGtkanNUY2FsamVLVWlh?=
 =?utf-8?B?Nm5va2ozbzNqVjFYZXBWcTlNSWlZczFERHMvM1dXOVB1L21QVnhtSEFBa0ZL?=
 =?utf-8?B?bW9EVWVhOHBxNERrMjZlQTZPalZab093Z2FZd0hTbnlTOTBPYnBwNmpSTWVU?=
 =?utf-8?B?MTEwWEZQQW5BZDhKUVZ0bG1Ya3FaK3lFWmRpTy9GQnEzcWFaallTZm4wSnZV?=
 =?utf-8?B?NUNOWTJLM1VMajIwSTZZQ3M4eW1MVUF5dmp0R3lSVysvakwyWW8zRFNubnBK?=
 =?utf-8?B?NG8wVE15dkNQbVh1NThxK3k4TUx2ZE5xVDkvWXBsbVlNUVZhUFdmQ2t4UWs1?=
 =?utf-8?B?bG9aUDlWQ0lUVXRoUm53VmRYSnVWcFNNZHB2T2FZZnhFOVdBUjl2NUhhdVNq?=
 =?utf-8?B?a3NGajBmK2NPL2tubmE4eDVUZmZnYWxvaFkxZTFoKzFNUm03MTlVRzJnV2Vx?=
 =?utf-8?B?bXErNC9DV1ZtS0FpeFRKaFVhQmdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cfe33d-6540-4d04-6586-08d9f02520a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 01:47:29.9509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vk3FprcHKRWoXG+p4AkJSeekzDftnIJQwIw6NEUHNeQW6eO0MvP1sdOYZr/nvjRrRJF3xrQrIQStjG4iN3JVmEkP2ve27c90I82w65Z96r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4871
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBGcmlkYXksIEZl
YnJ1YXJ5IDExLCAyMDIyIDEwOjExIEFNDQo+IA0KPiBPbiBXZWQsIDkgRmViIDIwMjIgYXQgMDI6
MjksIENoaWFXZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPiB3cm90ZToN
Cj4gPiA+IEkgd291bGQgbGlrZSB0byBzZWUgZmV3ZXIgdHJlZXMuDQo+ID4gPg0KPiA+ID4gSW4g
dGhlIHNob3J0IHRlcm0sIG9uZSBvcHRpb24gaXMgd2UgcHV0IGFsbCBvZiB0aGUgb3BlbmJtYyBw
YXRjaGVzDQo+ID4gPiBpbiB0aGUgU0RLLCBhbmQgY29udGludWUgdXNpbmcgdGhhdCBmb3Igb3Bl
bmJtYy4gV291bGQgdGhpcyB3b3JrIGZvcg0KPiBhc3BlZWQ/DQo+ID4NCj4gPiBZZXMuDQo+ID4g
QXJlIHdlIGdvaW5nIHRvIGRvIHRoaXMgdGhyb3VnaCBQUnMgYXMgdXN1YWw/DQo+IA0KPiBXb3Jr
cyBmb3IgbWUuIEkndmUgc2VudCB0d28gUFJzIHdpdGggdGhlIG9idmlvdXMgY2hhbmdlczoNCj4g
DQo+ICBodHRwczovL2dpdGh1Yi5jb20vQXNwZWVkVGVjaC1CTUMvdS1ib290L3B1bGwvOQ0KPiAN
Cj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9Bc3BlZWRUZWNoLUJNQy91LWJvb3QvcHVsbC84DQo+IA0K
PiBXZSBuZWVkIHRvIHdvcmsgb3V0IGhvdyB0byBhcnJhbmdlIHRoZSBkZWZjb25maWdzLiBXb3Vs
ZCB5b3UgbGlrZSB0byBzZWUNCj4gb3BlbmJtYyB1c2luZyBvbmUgb2YgdGhlIGRlZmNvbmZpZ3Mg
eW91IG1haW50YWluLCBvciBzaG91bGQgd2Uga2VlcCBhDQo+IHNlcGVyYXRlIG9uZT8NCj4gDQo+
IGNvbmZpZ3MvZXZiLWFzdDI2MDAtY290X2RlZmNvbmZpZw0KPiBjb25maWdzL2V2Yi1hc3QyNjAw
X2RlZmNvbmZpZw0KPiBjb25maWdzL2V2Yi1hc3QyNjAwLWVjY19kZWZjb25maWcNCj4gY29uZmln
cy9ldmItYXN0MjYwMC1lbW1jX2RlZmNvbmZpZw0KPiBjb25maWdzL2V2Yi1hc3QyNjAwLXNwbF9k
ZWZjb25maWcNCj4gY29uZmlncy9ldmItYXN0MjYwMC1zcGwtZWNjX2RlZmNvbmZpZw0KPiBjb25m
aWdzL2V2Yi1hc3QyNjAwLXNwbC1uY3NpX2RlZmNvbmZpZw0KPiBjb25maWdzL2V2Yi1hc3QyNjAw
LXNwbC10aW55X2RlZmNvbmZpZw0KDQpUaGVzZSBldmItYXN0MjYwMC14eHggZGVmY29uZmlncyBh
cmUgc3RpbGwgdXNlZCBieSBBc3BlZWQgY3VzdG9tZXJzIHdobyBhcmUgbm90IG1vdmluZyBvbiB0
byBPcGVuQk1DIHlldC4NCkxldCdzIGtlZXAgdGhlbSBzZXBhcmF0ZWQgdW50aWwgdGhlIGxlZ2Fj
eSBBc3BlZWQgU0RLIGlzIHBoYXNlZCBvdXQuDQpBZnRlciB0aGVuLCB3ZSBjYW4gd29yayBvbiBt
ZXJnaW5nIHRoZXNlIGRlZmNvbmZpZ3Mgd2l0aCB0aG9zZSBvZiBvcGVuYm1jIGZvciBzaW1wbGlj
aXR5Lg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0KDQo+IA0KPiBUaGUgb3BlbmJtYyBvbmVzIGFyZSBo
ZXJlOg0KPiANCj4gY29uZmlncy9hc3QyNjAwX29wZW5ibWNfZGVmY29uZmlnDQo+IGNvbmZpZ3Mv
YXN0MjYwMF9vcGVuYm1jX3NwbF9kZWZjb25maWcNCj4gY29uZmlncy9hc3QyNjAwX29wZW5ibWNf
c3BsX2VtbWNfZGVmY29uZmlnDQo+IA0KPiBUaGUgb3BlbmJtYyBhbmQgb3BlbmJtY19zcGwgZGVm
Y29uZmlncyBhcmUgbGVnYWN5IGFuZCBub3QgdGVzdGVkIGJ5IG15c2VsZi4NCj4gSSBhY3RpdmVs
eSBtYWludGFpbiB0aGUgb3BlbmJtY19zcGxfZW1tYyBjb25maWd1cmF0aW9uIGFzIGl0IHN1cHBv
cnRzIHRoZQ0KPiByYWluaWVyL2V2ZXJlc3QNCj4gDQo+ID4gPiBJbiB0aGUgbWVkaXVtIHRlcm0s
IHdlIHNob3VsZCBzdGFydCB1c2luZyB1cHN0cmVhbSByZWxlYXNlcy4gVGhlcmUNCj4gPiA+IG1h
eSBzdGlsbCBiZSBzb21lIGRvd25zdHJlYW0gY29kZSAoYXMgd2UgaGF2ZSBmb3IgTGludXggaW4g
b3VyIGRldg0KPiA+ID4gYnJhbmNoZXMpLCBidXQgdGhpcyB3aWxsIGdvIHRvIHplcm8gb3ZlciB0
aW1lLg0KPiA+DQo+ID4gQWdyZWUuDQo+ID4gV2UgYXJlIGFsc28gd29ya2luZyBvbiB1cHN0cmVh
bWluZyBmdW5kYW1lbnRhbCBkcml2ZXJzIHRvIFUtQm9vdA0KPiBtYWlubGluZS4NCj4gPiBPbmNl
IGl0IGlzIHN1ZmZpY2llbnQgZm9yIG1vc3QgZnJlcXVlbnRseSB1c2VkIGJvb3RpbmcgcGF0aHMs
IEFzcGVlZCB3aWxsIHN0YXJ0DQo+IHVzaW5nIGl0Lg0KPiANCj4gRXhjZWxsZW50LiBUaGFuayB5
b3UgZm9yIHlvdXIgd29yayBpbiB0aGlzIGFyZWEuDQoNCg==
