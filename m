Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7635F6AA74F
	for <lists+openbmc@lfdr.de>; Sat,  4 Mar 2023 02:34:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PT6pQ1vXSz3cdM
	for <lists+openbmc@lfdr.de>; Sat,  4 Mar 2023 12:34:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=H7gEJO4c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::724; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=H7gEJO4c;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20724.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PT6nc50pCz3bgr;
	Sat,  4 Mar 2023 12:34:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDY1jHdg5BPj0DdJEF0pmDXKC0spxxqFp6wD+UJODTJ5xGH+OEgHWINCGr3dr0JWKved5xZX79AYqqZYDWYsn9Zk92J66UGu6ZRnKo2Vav1H1/ggYgQU0M8UHNR4axy/jJkwhc26dGgSTWXd796yabdA7GI0qYh4+NbCIJa2RY5aDiztQcH+6QUmBVDKFoZbIGwqpeuibM8HGkzLcoLnaAiH1uG2IhB3u2AXDOE5h7u2ldyadaNAd1HIHxHBPHY1tPVeBerokaZwxRSVmy0ejmu5OfZuMN9oNtZrx32XVrFu8rq0tt2rFuVCHy0wdf9PtlKCJL6sR1gecLgNDhjuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPy0thofkuz+LJS+Td/zgdn3hHV/EQGoPD/UZsKJ3P8=;
 b=NYJShvofc1ULqsCQSx4dXRu+JeM+N9F3qGLJt3Q+KPRJJnNhjjHNSA9xKJRrqsvnNW+27DDYIST9DI8o/pMyEPAfkwlkB5XjIYV+4dsv4sDyNVBcscgYuPgIVhXq9OYOBec6aMRekS+tnCMEI28Xo0+CL8UzqIZZC0TKl4d729rf+tcpebHgfn9KCgg88FzY1e3deEX6aby+ikY1dOHykNT2lmS6LlfMiLZFZucqYe40P+FPPArCtjTB/QHWRmfRMM3STlwgzjbvr9O5bp+Y9z3XSkGjg2gZN/QjfOggpfKnvUcXtxiFgCQ+gYTQyBBd7CPHCPIT2I/CjO1//wUFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPy0thofkuz+LJS+Td/zgdn3hHV/EQGoPD/UZsKJ3P8=;
 b=H7gEJO4cPWSvWwcx06I2z+WiNellXCMUPYABXNAaRo4TlPiGX8aLXJQBc3vjStCfFuD/7o1hnRoSVIcf3I212TzSjswMG2DePSod07IO7yIhDQX2Y7cURmBMdz8GkaxGeKiMX2qD1+UlTQ+paBj4PD1Y44uEY2cmXXf48F80PIZPV8Kf1fbGSU/g/gOgYeqIHnGb8+c/pUbuJ5qs6TrsGRbVQBpf9ziOTsAib1rAJvYgBoG4z+/CvqtnlcJBC0qeeT14+g33V04HqDR7TYQo5QYPXFVpGzTOkDWEDEdMqmnjw1QD2nxaNGiPgLcpNGntD+pCCUaWKmgcZpvCKT1taQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5409.apcprd06.prod.outlook.com (2603:1096:4:1ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.12; Sat, 4 Mar
 2023 01:33:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Sat, 4 Mar 2023
 01:33:43 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwIAACb6AgAANnCCAAAdYAIAA+Hug
Date: Sat, 4 Mar 2023 01:33:42 +0000
Message-ID:  <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
In-Reply-To: <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB5409:EE_
x-ms-office365-filtering-correlation-id: cbd08205-b29e-4134-9042-08db1c507d73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  taHTPZ8Tyj6kJ7LHjorS6x50ddIbzXNVsO7K3ImU+2+yNRGE8ki9NUrNhL27fp2dJtfN2cGzcRZ5R1hx7tkfTelBulfYKx984gR8GBnhtrLBwrGJHP6bjhNJimdYnS/00SuQUj28N2q1UIlmJlvpguE5oGvh6f7PQ30b8egXAksgLt5716D9lswZ85GUX7ea8ZgEREnJd9ICvvG9Zum+HtRzTD5OoQjxB9g7QKPCGZ1dtEW5ZdHyO+t3gXYxVaYD7bTCJB7WwPbsBblNnu6UE5E/I1b3uHWOAcaW8Hp056mkj9E1cI6jhTqkXWS4WdJnOxejjsxVClVXW/80vFdRMPAGxlFG4kPod7tE2hjLQm8kodjjbsEYZ0IVktlreOIBznbsj7el2fa7NtxJpH9bllHggffM1p9fNUnule7fjXkN6fMNKIL8zuKwBf6M85MoEEm9J+8lSHT3uv/bF/iEudceXU9JLs7xx74BxplaEUaaLd+eFM/R8471hRsmhViOF3xy/9wsfFW5Zm1SjYtHKRo7H/VNuUSugjplI+UpApW2uvlOL5xNJ5fuJCNHkclI36PGOIxc4KAHM+razljSfqrQqimdFCW1fWJ/BKcnTQ2mvlA+dKRzR44LZELzinXjIp9Rn9vefhXr6flYKlqwxDQ+Ipg4eFZ+lJ2msG3xP/pPJNoSJuef3ZNPSD+tYrtF
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(366004)(136003)(39850400004)(451199018)(7696005)(71200400001)(83380400001)(966005)(6506007)(53546011)(38100700002)(478600001)(26005)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(54906003)(186003)(316002)(110136005)(9686003)(8676002)(4326008)(41300700001)(8936002)(52536014)(5660300002)(7416002)(122000001)(2906002)(55016003)(86362001)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eVdPM1NtYXd1cWpWb1J2YWpHUTIyWTY0WUtOd2IwaDN5RW1DMDRvWGlPNCtw?=
 =?utf-8?B?SWlsYXJ2N0xTZjAwdkZlS05WNm51UWhBMTR0aGVXRHJrNkM0RnYxQjBKbkxU?=
 =?utf-8?B?QytQdjREVExhK3J2Zkx3NkljOFN1MW45dGxySzVDRUwrVHRCSUgyeCtTbmRJ?=
 =?utf-8?B?OGo4aHJNRGo4TWxnanZHZkpMT3Y2dlRXLzBjT0p0YW9tT3hlcXVqdjVtN2xz?=
 =?utf-8?B?MXNrUHhjM3FsUHEzdWNUb09leS9KakZvbmN1dElNZXZVNVpEUDBTakxVTzdr?=
 =?utf-8?B?VXlDakd1eEsxTTRLcjNUVHNCTWxodmM2Zks3NjhJOUR6VFN4bm4xeE5VNk81?=
 =?utf-8?B?R0xmTmwwQWt2SkRzQXRVMDlHS2JKSHNLdnhjSE5GeXNsam5sZHp2YWVXalpP?=
 =?utf-8?B?Q3RYL2F0TGpYMmZaemx4ZUNnVFpmUS9uK1RIZzJMQnRVUVo2bStrclRDa3Nw?=
 =?utf-8?B?RTkvdmczNkxVL3NiOHR5Y0tRY2RDTnVCc0lWL0EwYk1CWkFRS2ZlcFNNMEcx?=
 =?utf-8?B?LytmZkVoTHRTOHpGVU02cjhlb0kzcTY0dDRKcGJUVS9OL3pkbzhMMW1tZExt?=
 =?utf-8?B?Umh0VjZ1aU4zZFNCck5XRkRRWlkzdUh4aTArWXJUcXJuN2RkbFE3MTNWUmw0?=
 =?utf-8?B?OXhIVGk4b0o0WlpxNkkrdnN1dzE3UTBiS1E4bEVXVndYZi9NeVJydzBtRUJm?=
 =?utf-8?B?cFRSbmlHc0ttTUovUXNCOHlZZW9qbkFoMCsvdktYZ3N6ZnZqbkt5cjNsR3Zn?=
 =?utf-8?B?bnpkSXNWR2ZSMURHNVF4VDI0MXAzbHFrb05oYjZMa241dzJFbjRSVXI4bnNH?=
 =?utf-8?B?U3Rzb1JaaWxQOXF0QVM3UVdkQnZHcXhKL2dxb1pvRnJtL01xMXBibFdlY0h4?=
 =?utf-8?B?WnhCVDEvMUFuT2hIRlFscFRVaDlwaWVUN1dYMCsrTW45dVhFbU9nSlQ0L2Z5?=
 =?utf-8?B?WXZBQkxHb0hUbGcvcDdPQUhhQWlrS3d4U1RFZXJNQnU5eUtVQ2ZQUGRVakYv?=
 =?utf-8?B?eG81TnRPRVJqQ1ZkbmwzWksrZThNai9xbWZsUnF3Y0pXbmd5eWhDU2lreE9Z?=
 =?utf-8?B?Mm5zbFpnQi9OOGVoby9qL2E5WCtZUXZTRGpXbHJIVUVOQ1JlT0pMOFMvcENT?=
 =?utf-8?B?dGJNTURuZGliUDJGRTdVQTBTTnpIOWU2MnhHNTM1N2VvVEpucDlTb0lKbWla?=
 =?utf-8?B?ektGcTJkQkpMeHdHalRtS3ZNR0dFMlFXU0x3eDYwUFVDbkk0ZkJ3ZVBHTlZu?=
 =?utf-8?B?U3JEUFdlMXlpUU5JRGlFZmdpN3ZMS1JtSnB3RUsvbFdoVmpKbXZia1g0Umpm?=
 =?utf-8?B?ZzdkNXlESnhHcW03TzlHSGFDUXdIbWJjNnZPR2U3OEsxZ2xEUXJNTm42Sm9a?=
 =?utf-8?B?MncxaWR2c01Wa0FyTmtkdSsrbEdlL05wd1pYNHVMRkdOMDNJMVNucDh4UTBL?=
 =?utf-8?B?bWRBbmlyVXRldUtuYXNpaWJ3ZGQyMHRnNm9CSjJOSmJUaWlYci9Obml5ZTN3?=
 =?utf-8?B?bi8zd3lqVGdVMFBoWGdOSEFXYlVnRTZhcmcyNnZKL0F5bEpwK1VDR3Z1R1ZD?=
 =?utf-8?B?ZlBRMnU3ZTJFNGlqV0ZmRFdtRGljR1ZOMmxSTGlSSlNnR2J3alJRVTNhUjk2?=
 =?utf-8?B?U3gvMXJUZ1N0UmZ3VlcxdnhsaWpyS2F2UnlEU3Jra3lCWGJzcVVIQ3l5S1Z6?=
 =?utf-8?B?ME1kKzZOYXJXSGFqQWFCOXNOTlAyR1JhZklNUmFVM0pWWnRtUEZ6ZWFCTzhO?=
 =?utf-8?B?L08vcWc0T09XZkd4ZlMrTDduR2pzL2tCUFJDQ3ZHSDlsUStFek5BQVlzd0hq?=
 =?utf-8?B?MW80aDU5QXNDN1pwYUVuM3ZZZ3ZFNU9DWVAvTnMyVGpFam1hdHprUFNrN3lr?=
 =?utf-8?B?djFyd2VFNk5rdXNDTDJjVWdtMHN2cE95QitlS28zSSt3QmlXNDZHZS8zZEJS?=
 =?utf-8?B?Zy9td0lyR1dhZjlEUW5GN3FZZHQxN2xwamc4Q0xPL09RblJ5YkpLanMvTDRM?=
 =?utf-8?B?S3VIaEFHMFJIeGt0by9JWVJJakNLUVJlU0xMUUpYMzdjT3RITzlRME5CV0Q3?=
 =?utf-8?B?Sk9qS3ZxenBTblBHbS84a2hieHBrb0haMkdjTXdrdTdiZGVqV01wd05nY1hI?=
 =?utf-8?B?Ny9wdllKb1p4Z2QxSWtwUTcxTnI5d3RSK1FxYVpwMGRDczhPR29RbjVldSsz?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd08205-b29e-4134-9042-08db1c507d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2023 01:33:43.0431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77FMCNUVttdlOjuswJmasfhPl6zNunSU7omDnUoxEine2IChHmF+kMzEcDOhS6TMM02I2Jxn0UQh+VBzmTb987LyzvhRSSi/oRa+SHoJzV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5409
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogRnJpZGF5LCBNYXJjaCAzLCAyMDIzIDY6NDEgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8cnlh
bl9jaGVuQGFzcGVlZHRlY2guY29tPjsgV29sZnJhbSBTYW5nDQo+IDx3c2FAa2VybmVsLm9yZz4N
Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMNCj4g
PGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5
c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFq
LmlkLmF1PjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3Jn
PjsgQmVuamFtaW4gSGVycmVuc2NobWlkdA0KPiA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPjsg
bGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yIEFT
VDI2MDAtaTJjdjINCj4gDQo+IE9uIDAzLzAzLzIwMjMgMTE6MTYsIFJ5YW4gQ2hlbiB3cm90ZToN
Cj4gPj4+Pj4+PiBhc3BlZWQsdGltb3V0IHByb3Blcml0ZXM6DQo+ID4+Pj4+Pj4gRm9yIGV4YW1w
bGUgSTJDIGNvbnRyb2xsZXIgYXMgc2xhdmUgbW9kZSwgYW5kIHN1ZGRlbmx5DQo+ID4+IGRpc2Nv
bm5lY3RlZC4NCj4gPj4+Pj4+PiBTbGF2ZSBzdGF0ZSBtYWNoaW5lIHdpbGwga2VlcCB3YWl0aW5n
IGZvciBtYXN0ZXIgY2xvY2sgaW4gZm9yDQo+ID4+Pj4+Pj4gcngvdHgNCj4gPj4+PiB0cmFuc21p
dC4NCj4gPj4+Pj4+PiBTbyBpdCBuZWVkIHRpbWVvdXQgc2V0dGluZyB0byBlbmFibGUgdGltZW91
dCB1bmxvY2sgY29udHJvbGxlciBzdGF0ZS4NCj4gPj4+Pj4+PiBBbmQgaW4gYW5vdGhlciBzaWRl
LiBJbiBNYXN0ZXIgc2lkZSBhbHNvIG5lZWQgYXZvaWQgc3VkZGVubHkNCj4gPj4+Pj4+PiBzbGF2
ZQ0KPiA+Pj4+Pj4gbWlzcyh1bi1wbHVnKSwgTWFzdGVyIHdpbGwgdGltZW91dCBhbmQgcmVsZWFz
ZSB0aGUgU0RBL1NDTC4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IERvIHlvdSBtZWFuIGFkZCB0aG9z
ZSBkZXNjcmlwdGlvbiBpbnRvIG9yZSBhc3BlZWQsdGltb3V0DQo+ID4+Pj4+Pj4gcHJvcGVyaXRl
cw0KPiA+Pj4+Pj4gZGVzY3JpcHRpb24/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gWW91IGFyZSBkZXNj
cmliaW5nIGhlcmUgb25lIHBhcnRpY3VsYXIgZmVhdHVyZSB5b3Ugd2FudCB0byBlbmFibGUNCj4g
Pj4+Pj4+IGluIHRoZSBkcml2ZXIgd2hpY2ggbG9va3Mgbm9uLXNjYWxhYmxlIGFuZCBtb3JlIGRp
ZmZpY3VsdCB0bw0KPiA+PiBjb25maWd1cmUvdXNlLg0KPiA+Pj4+Pj4gV2hhdCBJIHdhcyBsb29r
aW5nIGZvciBpcyB0byBkZXNjcmliZSB0aGUgYWN0dWFsIGNvbmZpZ3VyYXRpb24NCj4gPj4+Pj4+
IHlvdSBoYXZlDQo+ID4+IChlLmcuDQo+ID4+Pj4+PiBtdWx0aS1tYXN0ZXIpIHdoaWNoIGxlYWRz
IHRvIGVuYWJsZSBvciBkaXNhYmxlIHN1Y2ggZmVhdHVyZSBpbg0KPiA+Pj4+Pj4geW91cg0KPiA+
Pj4+IGhhcmR3YXJlLg0KPiA+Pj4+Pj4gRXNwZWNpYWxseSB0aGF0IGJvb2wgdmFsdWUgZG9lcyBu
b3Qgc2NhbGUgbGF0ZXIgdG8gYWN0dWFsIHRpbWVvdXQNCj4gPj4+Pj4+IHZhbHVlcyBpbiB0aW1l
IChtcykuLi4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBJIGRvbid0IGtub3cgSTJDIHRoYXQgbXVjaCwg
YnV0IEkgd29uZGVyIC0gd2h5IHRoaXMgc2hvdWxkIGJlDQo+ID4+Pj4+PiBzcGVjaWZpYyB0byBB
c3BlZWQgSTJDIGFuZCBubyBvdGhlciBJMkMgY29udHJvbGxlcnMgaW1wbGVtZW50IGl0Pw0KPiA+
Pj4+Pj4gSU9XLCB0aGlzIGxvb2tzIHF1aXRlIGdlbmVyaWMgYW5kIGV2ZXJ5IEkyQyBjb250cm9s
bGVyIHNob3VsZA0KPiA+Pj4+Pj4gaGF2ZSBpdC4gQWRkaW5nIGl0IHNwZWNpZmljIHRvIEFzcGVl
ZCBzdWdnZXN0cyB0aGF0IGVpdGhlciB3ZQ0KPiA+Pj4+Pj4gbWlzcyBhIGdlbmVyaWMgcHJvcGVy
dHkgb3IgdGhpcyBzaG91bGQgbm90IGJlIGluIERUIGF0IGFsbA0KPiA+Pj4+Pj4gKGJlY2F1c2Ug
bm8gb25lIGVsc2UgaGFzDQo+ID4+Pj4gaXQuLi4pLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEFsc28g
SSB3b25kZXIsIHdoeSB5b3Ugd291bGRuJ3QgZW5hYmxlIHRpbWVvdXQgYWx3YXlzLi4uDQo+ID4+
Pj4+Pg0KPiA+Pj4+Pj4gK0NjIFdvbGZyYW0sDQo+ID4+Pj4+PiBNYXliZSB5b3Uga25vdyB3aGV0
aGVyIGJvb2wgInRpbWVvdXQiIHByb3BlcnR5IGZvciBvbmUgY29udHJvbGxlcg0KPiA+Pj4+Pj4g
bWFrZXMgc2Vuc2U/IFdoeSB3ZSBkbyBub3QgaGF2ZSBpdCBmb3IgYWxsIGNvbnRyb2xsZXJzPw0K
PiA+Pj4+Pj4NCj4gPj4+Pj4gQmVjYXVzZSwgaTJjIGJ1cyBkaWRu4oCZdCBzcGVjaWZpYyB0aW1l
b3V0Lg0KPiA+Pj4+PiBCdXQgU01CdXMgZGVmaW5lcyBhIGNsb2NrIGxvdyB0aW1lLW91dCwgVElN
RU9VVCBvZiAzNSBtcy4NCj4gPj4+Pj4NCj4gPj4+Pj4gSXQgaGF2ZSBkZWZpbml0aW9uIGluIFNN
QnVzIHNwZWNpZmljYXRpb24uDQo+ID4+Pj4+IGh0dHA6Ly9zbWJ1cy5vcmcvc3BlY3MvU01CdXNf
M18xXzIwMTgwMzE5LnBkZg0KPiA+Pj4+PiBZb3UgY2FuIGNoZWNrIFBhZ2UgMTgsIE5vdGUzIHRo
YXQgaGF2ZSB0aW1lb3V0IGRlc2NyaXB0aW9uLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlbiB5b3UgaGF2
ZSBhbHJlYWR5IHByb3BlcnR5IGZvciB0aGlzIC0gInNtYnVzIj8NCj4gPj4+IFRvIGJlIGEgcHJv
cGVydHkgInNtYnVzIiwgdGhhdCB3b3VsZCBiZSBhIGJpZyB0b3BpYywgSSBzYXcgZnNsIGkyYw0K
PiA+Pj4gYWxzbyBoYXZlIHRoaXMuDQo+ID4+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cg0KPiA+Pj4gZWUNCj4gPj4+
IC9iaW5kaW5ncy9pMmMvaTJjLW1wYy55YW1sI0w0My1MNDcNCj4gPj4+IFNvLCBJIGp1c3QgdGhp
bmsgdGhlICJ0aW1lb3V0IiBwcm9wZXJ0eS4NCj4gPj4NCj4gPj4gWWVhaCBhbmQgdGhpcyBpcyB0
aGUgb25seSBwbGFjZS4gSXQgYWxzbyBkaWZmZXJzIGJlY2F1c2UgaXQgYWxsb3dzDQo+ID4+IGFj
dHVhbCB0aW1lb3V0IHZhbHVlcy4NCj4gPiBUaGFua3MsIFNvIGNhbiBJIHN0aWxsIGtlZXAgdGhl
IHByb3BlcnR5ICJhc3BlZWQsdGltZW91dCIgaGVyZT8NCj4gPiBJdCBpcyB0aGUgb25seSBwbGFj
ZS4NCj4gDQo+IE5vLCBiZWNhdXNlIG5vbmUgb2YgbXkgY29uY2VybnMgYWJvdmUgYXJlIGFkZHJl
c3NlZC4NCj4gDQpUaGFua3MsIEkgcmVhbGl6ZSB5b3VyIGNvbmNlcm5zLg0KDQpTbywgSSBtb2Rp
ZnkgaXQgbGlrZSBpMmMtbXBjLnlhbWwgDQpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGlu
dXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMt
bXBjLnlhbWwjTDQzLUw0Nw0KDQogIGFzcGVlZCx0aW1lb3V0Og0KICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KICAgIGRlc2NyaXB0aW9uOiB8DQogICAg
ICBJMkMgYnVzIHRpbWVvdXQgaW4gbWljcm9zZWNvbmRzDQpJcyB0aGlzIHdheSBhY2NlcHRhYmxl
PyANCg0KQmVzdCByZWdhcmRzLA0KUnlhbiBDaGVuDQo=
