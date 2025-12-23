Return-Path: <openbmc+bounces-1077-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718DCE5B42
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dffGn5Ghrz2yFj;
	Mon, 29 Dec 2025 12:47:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.103.43.48 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766482323;
	cv=pass; b=KsHiRrvH5Ey2M8pmzsoRw+ChVIvlvlYhp98hfD3JtEVecSGUNps50zYVPEPUjfvO3YlXJ2ontZ4EK71o3nZ3448nwRSmm7nGTv1+G+KX7T/0hXWCpwryd//bJzw3U3KvbNCTaaWsgMDIEvhSM7efPNOoaBjzyF5XpZfo+1WnF159m6fIU6JQnQgBwoPHOc9B+oMNWM6V9cbMEfxkxZVb+wwbe0CbWhJUvbOWi5toFtLiHjQYdtXjUGTmIG8dacs0Ia8OS961BnVBLKtPYGugW8RjyZgFNEG5zT3Y+VVb8WyyKdT2yQXZb7EhBGKrM82YtZdOfXq1+UjJqDxg56wUVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766482323; c=relaxed/relaxed;
	bh=+s3k0NDVgC7HwrJiqkvQK5CQMRSq1GExf4qM2bJ0VBE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J2bRqjznuwqiXMbBxMAlatDGCcSdb88NlSPH7aAevLs0Jk5JJRVV5jP3qrfCNRFt2FoQJjZ0cbSO7bvHi/VzHr4c7JcKJd8BWCx1ODn2qaPNaM0fYsVbNzT65AjB5d0OTZO8SIQQv9+A58ljF5iXdaAoR3I+0oJVr0zp0pmqVLBEAZeIfud4nRomtzX/E2DX9lNQEcErl+Y0WmrKu28UOHn5D2z6RSUoRIS96RjVcizsxpiw5rZlJL5BEwD8av9XXR23ZUraHmwntsVdKIsnCgoN+hCBPKqEkvOZL6ERrt33+uh7Tc/IigS6U0hhQunUagCzq5IYmNs66mOOk0s/CA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JhE8Dw2x; dkim-atps=neutral; spf=pass (client-ip=52.103.43.48; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=qdwby2008@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JhE8Dw2x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=52.103.43.48; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=qdwby2008@outlook.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012048.outbound.protection.outlook.com [52.103.43.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4db8ss5F55z2x99
	for <openbmc@lists.ozlabs.org>; Tue, 23 Dec 2025 20:32:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0khwjgJgW7bSWlw58L1M+bXLnsfJOl36KLoKPQ8KyyDieTHM52FV9Ol8uHmq3GHihJFLE6EUfI4KDwgeYX1e1tMOx+K/G30W9VkLSHy0aDtNavLc5SVjqcEGK1hVCyJBVW4IB5iNipfirCY0acos0y1i/4zotHuTBMD7RYjc7BzhhXUsFAEYnLu5aRuMkWBl8e96SnmnO9zUhREaBjT8ZyZNfD4J2kcokRL8RUHPFoU0BgU8jYsMsN6merO5ZACGAcJR7PYCwYSo1P8HybAZtOJzQI9Pcg0R9dy7wwOCNOYPUVkHFX/84U6DtvJ4GXRfa/e440K3aqydQHERgIdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s3k0NDVgC7HwrJiqkvQK5CQMRSq1GExf4qM2bJ0VBE=;
 b=dSZ1riJr7fH/erYyNRLc6XY6QpG14KkmCsdsUWXMwndH7PnwhsTmy8+aZgEH5hPOCoOu3TVFEo6zxewgYOFgQ/JTNXhlvaGI0sNJvVy0e8+NzYr2kYZ0gnFMmHQfOjeIwvvJIuY1O7dVBsv7auJtOMNb/rNndn9yxYfY4/CrpUWETdepFWMWB2XLMwuddXHKaHC1MIVXEsdBVRU9s0EZzoNux8FWjRTz8E2uQWCk7XZqR1WEgYzgnILx3lvXR8ZgeHajtID+B/U/dcCAJFjYQS5O4v8soCIYTIlrchf+xEPNpoO85vgYqrnoT5L2J9lus5J5HAWESVDRMz7zcKlpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s3k0NDVgC7HwrJiqkvQK5CQMRSq1GExf4qM2bJ0VBE=;
 b=JhE8Dw2xA8t4Lj7FCuAUCpaq2uCiEpdgURhzA50/pZSyZEb9hMgkAvpnqYvuaMIbjyGHI8sMWwcbCSHe8pjhxT86i32TARHZ5Z/QFN9bI6DInmF5MXxo4ygcwPJQ4oXpSsg1k5LGdQhFXTdDCde/6W1mOm68LZQSv63kUZkIHz4thL3uYYGZEgXNO4ANoKK/6PGCx6zZHZvXCC5mBkHAJozKSsNHOWnJtHx2xSrHZpf7WPR7YIwb39fDJStfyPIvEzb3i9PFhwWyd9ojuSoMkGGYPu38OiQZWGeMoVZNU2hJB/zVlasn5j6/uWPhh7SmuBE77bbOKpANKcp6LF67QA==
Received: from TYZPR04MB7269.apcprd04.prod.outlook.com (2603:1096:400:45a::8)
 by JH0PR04MB7464.apcprd04.prod.outlook.com (2603:1096:990:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 09:31:21 +0000
Received: from TYZPR04MB7269.apcprd04.prod.outlook.com
 ([fe80::317c:5eb1:cf4e:bc19]) by TYZPR04MB7269.apcprd04.prod.outlook.com
 ([fe80::317c:5eb1:cf4e:bc19%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 09:31:21 +0000
From: qiu ding <qdwby2008@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject:
 =?gb2312?B?u9i4tDogaXBtaSBpc3N1ZXModWJ1bnR1IDIyLjA0IGFuZCBvcGVuYm1jIHYy?=
 =?gb2312?Q?.12.0)?=
Thread-Topic: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
Thread-Index: AQHccl5wyQH8/M9nl0OIpm5p1LscLLUu+Cr8
Date: Tue, 23 Dec 2025 09:31:20 +0000
Message-ID:
 <TYZPR04MB7269BEB0CED686EFCA5833E3AFB5A@TYZPR04MB7269.apcprd04.prod.outlook.com>
References:
 <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
In-Reply-To:
 <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB7269:EE_|JH0PR04MB7464:EE_
x-ms-office365-filtering-correlation-id: ef3f53b6-536b-4b07-2b70-08de42060847
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|15080799012|15030799006|461199028|51005399006|19110799012|31061999003|8060799015|8062599012|102099032|40105399003|3412199025|440099028|3420499032|3430499032|26104999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?R3BLQm8xcDFyOHg0ZU9HdE5CUmd6RytycjFEcTh2emRBcVVUOFM2QXo3cGZT?=
 =?gb2312?B?b1RkZW1IbVdESEdScVBlaFRHTjFWYmxDVDJFYkI5akRIaVBNcks3QnpiRjEw?=
 =?gb2312?B?MEhmeTZhdXRrcTlZWGZTb1Nhdk5kZUNyQitUWGR1NlFkVVNUWHNpK1RpT1lU?=
 =?gb2312?B?Y0FDZDMrSG40RTVYMWRoSjh3dzc0SHg1UERzaUNhUmNTQlBZQ2xIY2NrYzNI?=
 =?gb2312?B?Z1lHTFk3V0drK3QvdXkyWU9MUGlZeStTUzZxbU5ZMVh0K2ppZmZmTlJhTXZn?=
 =?gb2312?B?R0tqcVhwazhjcGJVbkpRMjdUVlJqdWtaUjhrT3o0T25SYXBzU1NGV0F6N1Vm?=
 =?gb2312?B?NzQ4NUpoYTQ1MUdmVnJkYnI2SElqTkM5T1pvTitXdEl3MXB3Y0xhaGlpNlVa?=
 =?gb2312?B?VTRNMWNCb3kvQ0lvTVA0ZG1uOExYU01oeEc3NHgxZU5HQWZlOGllVWkrYlQw?=
 =?gb2312?B?T3o0cnBzYzB3aVg5T3NXM3VUcE9EYmlTOThUZ3F4emZsQjZtSzBYenVWL3V6?=
 =?gb2312?B?RHYxLzZpc0Q2QmxYMTZZSUlEY2EzSngzWG9LeHRLdWJWSDZ4a3lTRTlMSE4w?=
 =?gb2312?B?a3MzWGozOHdMNW5NTVV3UTJ4dXBuYldiemE2S0UvUVd1cFllcVhtTzNab3lW?=
 =?gb2312?B?SUlEb1FlR3BHQkdaN0tFRGllT1pQQXJTTHNBWXNCcGQycW1uN3dyNSt6THNY?=
 =?gb2312?B?dUJ4YkpVTi9wTEhrK2IzSmsrcjVPTTl4RFdaNnBWVk12ZnF0UWo2elMzSlJG?=
 =?gb2312?B?MUpFQmE1c2xRVFJiWDBPNEJHZzFQVFpBZTVoYXFaL1MxSndJbjRKY01BWmpI?=
 =?gb2312?B?cWJKZUF0dm9ma0t1SnpKWHdRUmZ5MWRDUEU5WDludkxjbEFvYXJTNEkweGdK?=
 =?gb2312?B?eStDQmlFakhsZWVENnFlNWZoRmNVTVN6N3p3aWtwSzR3Z0ZrMEYzYVM1QWpH?=
 =?gb2312?B?UGFFU2Yrb0k5aVZiWGVyTEhzR3h2ZUNhR1lZeXdBbXhXdldSMU5VZFdGcm44?=
 =?gb2312?B?WFlkWVlXWS83UmV2RktmYUtsY3Vmc2tWeGI0b0FVMkcxNzY3TFBBUWZadDJ1?=
 =?gb2312?B?SDUyY1dYdlIvc1BlQytCSlpWeS8wbXhFT0phRXB3MGd5ZXg2S0p1TzRQN2VL?=
 =?gb2312?B?T0drRWJkcDBsNGlFMkdOdXJ3a1JpbStndzBhRFRyMEluNm1DSEJBMVlEbDEw?=
 =?gb2312?B?SGRDcEg5Mzg5MEJRK21wNkJPNlFTcm15S2ZEOXdYWE50M1cveTRyWTlWK3FO?=
 =?gb2312?B?d1E2OURGSGFFZTJodndYcExUVFViNWgxMGxicGNGUytnZXpGd0VhQkxCNHZZ?=
 =?gb2312?B?Rlo0VmQwQ0RxZWRXbWVPTGJGaWhNWHE2WWI5d2U2VHFNSEZOcnFmUElFNjJF?=
 =?gb2312?B?cTBVdU5qMHhjREtNdFFOUWdtM0FjNzV0aldLSGs0aFo2aGF3UU1HZmxMVjRD?=
 =?gb2312?B?em9Ea3JaWXBMc3h6VVNRYzlwQmFsTVZqdjZQWjdsWktjaW1YdU5IbFYzc1Rx?=
 =?gb2312?B?SjMyUER3ZElYUkhSZGl1blVBVHd4dEswT3VNWTNWSUZsVERZRE54U3hzYmFk?=
 =?gb2312?B?SzNCMkI1dzR1ZmkvRnpBYjljdU85WWhqeGxUVkU0QlJkSWNGa3ZlaUYwNTVx?=
 =?gb2312?B?QkIzT3k4RmVramc0RkVmemMyd2VDVWVSYnlGekJ3UEFoclQ0RzIzQzg2YmRT?=
 =?gb2312?B?aTI0WWp2ZjUrajZJRmU3SGtEWlVaVzhzT2VFVS9uQ0labEtYdDUyM2VRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?VmxQSG1rZ1lvK3FIbzV0Z2wzVHhMV0ZOaEQrNjUwUmVKeWg4TGFmcmMxVE52?=
 =?gb2312?B?aVRURE9NMzJyZnJnaVNyMThHbzkyNjRpc3hsVHNScnVpc1dzaUJvbFZ2OU10?=
 =?gb2312?B?V0x1QkJmRW5hQVNJTkNTbUdqRjF6ZU9EamQ4Z0NlS25aMjV5d2l4OVlvcmY2?=
 =?gb2312?B?T0ovN1U5a0sxS09ITFFSNzlrOU84RVovZ0FUQ3pWekUyQmJ5eWlHdFk3SURj?=
 =?gb2312?B?NksvRnFoTXpZTUtSZmlnMWdyWC9VOGU1UGJFbVdWUjRFdUQzamJ3WkN6WEZI?=
 =?gb2312?B?TnZZZnJZdWpvdHgxSmN4QTZUZU13aG1YaHRJdnRyc2JrMGdPeWhBTkZSTGp6?=
 =?gb2312?B?M3FLUlRETUN2N1JrY21IZkwzd0d4UW9yU1MxcHZiNnl0dnBpb3k1eVh6NnRi?=
 =?gb2312?B?VkVrY1pwSnExenN4a2d5OXRkbm84bk9CZ0JRVlJmTk9Pb2xMVkxrZDBYclNh?=
 =?gb2312?B?bk4za2w3MTFBRlB4MUhEa3oxSTBCOXh6UHBZQy9ZdUx6SWZyc081SThTUHN2?=
 =?gb2312?B?VUF4SFR1Z0o0aStuMTV2TmNSK29Hc1N1c05hZmVBOWdhSlEyZmloTnhlZ2RP?=
 =?gb2312?B?em5pQ05WWU5aMm9wL3pVNUhrSWlmZko4amhWVWxvTjduN0hkTTl4MUpQUEVi?=
 =?gb2312?B?d3R3MXNrekkzM2hWQjJ3T0pOYW93a0JVZ0gwTFNmbHNYUlRlZDRPeDZiV1BL?=
 =?gb2312?B?RnlSemRyVndyb3k4S1B5cWQybkg5dTFMblBwR2V0TytXK0RsVHl3R1JmKzUv?=
 =?gb2312?B?SHhYZkpraE8vbWJPZzBQWXdGK2JHSUJXYzdrWlZRUGY5OWdLbFlSMGZMZ09q?=
 =?gb2312?B?WTJsWUxIWmxxSS9wZVBKbXh1TG9XdmtCZERSZTd5VG02clhIUlBuam9xaGQw?=
 =?gb2312?B?UnZkckF1cjBIcVEyR1lqdzVPMWs2b0hvdzZzNm8zU2RTbzZXbzVmUGpvUkRI?=
 =?gb2312?B?a1MzeW14aUJjNEQwRFpuUU9wcGtyRlU1cnVHNmZ6OE5lU3ZTL0xXVU0yNlV3?=
 =?gb2312?B?OFpqRXBTbmtCUE9qcVpHWUhUNGxSSGlCaFBsQWYrOGQzd0VaakhxUVl0czd4?=
 =?gb2312?B?NkR5ZE5idUkwQ2ZJeTVIUXV5S2tpUm5QRmMzb2d3elhoR1ZKOGtuSGk0enE3?=
 =?gb2312?B?Z014ZUR3NE5MNkJuam85Q2RqTFVLQ1E2Z29mR0lZTk5oa0h1a0R2cEszYkw5?=
 =?gb2312?B?b1VpSnQwcHgyeXBvandpTDhvaldHQ1h1MndaZUYzMGQ1cGswVk54bGNZdm5U?=
 =?gb2312?B?eUtXSW1WOW9nUTRuMWk2R3JSaTlrSkl3RldmSjRuNmRVNUJtelEzdzB5T2dQ?=
 =?gb2312?B?RU8zOEZVbTRXWXdwUzlTMlFoUUlMZGJmWktIU0M4MmhBblNYYWdmSDBKY2Rx?=
 =?gb2312?B?ZGdlK3VHVnlsUVFZTU5rMTA0L3hwNmNZT2RKaFFQbmdETmNmWmV6Mnhhay82?=
 =?gb2312?B?blBXak1iWDJNRHBodFN0VGZLb3h3dFpUaDM4R0dra290SGpTU3hyREN0MFhX?=
 =?gb2312?B?RGZuaHZsQjFTM29UZ1Z1YWNscmI3aDQxY2RkNnl6N3RxRlhWZTRIWW4wOW1G?=
 =?gb2312?B?bDJqa3VwZDY0eE1jdEhleVFheXVLNDIwL1BEUUlMeFVQUUFhNGhYWDRFZ2h1?=
 =?gb2312?B?THFIeTh5a3Z0MWkwNE5ML240SmM3R1RQMlNaL0d2eDhidUhIajhvZG5HbDg3?=
 =?gb2312?B?aDNMU3RFZEh6akZ1WnlLaWpadFlkNnpJQ1pzdXVzWlFucEZSdEtISVFVdnly?=
 =?gb2312?B?TXV4UUQrNGhWSVoraXZFemJnemthdWZzYXVkcVRTQkk2UW9yU2I5MVNOSHRW?=
 =?gb2312?B?dVZobnVtWmUzK1duanNod0dQbm1vaWxwV2tBVVAzWmpMRFRRbkZlYWdSSCtW?=
 =?gb2312?B?QWxVVUZwd2pxZWZpbWF2RUtNNGV3MG1uUDArRUVGQVQ3VkE9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_TYZPR04MB7269BEB0CED686EFCA5833E3AFB5ATYZPR04MB7269apcp_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB7269.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3f53b6-536b-4b07-2b70-08de42060847
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 09:31:20.9275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7464
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_TYZPR04MB7269BEB0CED686EFCA5833E3AFB5ATYZPR04MB7269apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LCBidXQgZXZlbiBhZnRlciBzcGVjaWZ5aW5nIC1DIDE3IGFuZCB1cGdyYWRpbmcg
dG8gdmVyc2lvbiAxLjguMTksIHRoZXJlIGFyZSBzdGlsbCBpc3N1ZXMgd2l0aCB0aGUgdmVyaWZp
Y2F0aW9uLg0KDQpNZXRob2QgMToNCg0KJCBpcG1pdG9vbCAtSSBsYW5wbHVzIC1IIDEyNy4wLjAu
MSAtcCA2MjMwIC1VIHJvb3QgLVAgb3BlbkJtYyAtQSBtZDUgbWMgaW5mbyAtQyAxNw0KRXJyb3I6
IFVuYWJsZSB0byBlc3RhYmxpc2ggSVBNSSB2MiAvIFJNQ1ArIHNlc3Npb24NCg0KaXBtaXRvb2wg
LUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG1kNSBtYyBpbmZvIC1D
IDE3DQpFcnJvcjogVW5hYmxlIHRvIGVzdGFibGlzaCBMQU4gc2Vzc2lvbg0KRXJyb3I6IFVuYWJs
ZSB0byBlc3RhYmxpc2ggSVBNSSB2MS41IC8gUk1DUCBzZXNzaW9uDQoNCk1ldGhvZCAyOg0KJCBp
cG1pdG9vbCAtLXZlcnNpb24NCmlwbWl0b29sOiDO3tCntcTRoc/uIC0tIC0NCmlwbWl0b29sIHZl
cnNpb24gMS44LjE5LjAuZ3NuYXBzaG90DQoNCnVzYWdlOiBpcG1pdG9vbCBbb3B0aW9ucy4uLl0g
PGNvbW1hbmQ+DQoNCiAgICAgICAtaCAgICAgICAgICAgICBUaGlzIGhlbHANCiAgICAgICAtViAg
ICAgICAgICAgICBTaG93IHZlcnNpb24gaW5mb3JtYXRpb24NCiAgICAgICAtdiAgICAgICAgICAg
ICBWZXJib3NlIChjYW4gdXNlIG11bHRpcGxlIHRpbWVzKQ0KICAgICAgIC1jICAgICAgICAgICAg
IERpc3BsYXkgb3V0cHV0IGluIGNvbW1hIHNlcGFyYXRlZCBmb3JtYXQNCiAgICAgICAtZCBOICAg
ICAgICAgICBTcGVjaWZ5IGEgL2Rldi9pcG1pTiBkZXZpY2UgdG8gdXNlIChkZWZhdWx0PTApDQog
ICAgICAgLUkgaW50ZiAgICAgICAgSW50ZXJmYWNlIHRvIHVzZQ0KDQokIGlwbWl0b29sIC1JIGxh
bnBsdXMgLUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG1kNSBzZXNz
aW9uIGxpc3QNCkZhaWxlZCB0byBpbml0aWFsaXplIHRoZSBPRU0gaW5mbyBkaWN0aW9uYXJ5DQoN
CiQgaXBtaXRvb2wgLUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG1k
NSBtYyBpbmZvDQpGYWlsZWQgdG8gaW5pdGlhbGl6ZSB0aGUgT0VNIGluZm8gZGljdGlvbmFyeQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogcWl1IGRpbmcNCreiy83K
sbzkOiAyMDI1xOoxMtTCMjHI1SA5OjUxDQrK1bz+yMs6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0K1vfM4jogaXBtaSBpc3N1ZXModWJ1bnR1IDIy
LjA0IGFuZCBvcGVuYm1jIHYyLjEyLjApDQoNCkhlbGxvLCBJJ20gdGVzdGluZyB0aGUgSVBNSSBp
bnRlcmZhY2Ugb24gdGhlIGV2Yi1hc3QyNjAwIHNpbXVsYXRvciB3aXRoIFVidW50dSAyMi4wNCBh
bmQgT3BlbkJNQyB2Mi4xMi4wLiBJJ20gZW5jb3VudGVyaW5nIGFuIElQTUkgYXV0aGVudGljYXRp
b24gaXNzdWUgKHRoZSBwb3J0IGlzIDYyMzAgLT4gNjIzLCBhbmQgcG9ydCA2MjMgaXMgbGlzdGVu
aW5nIG9uIFVEUCBieSBkZWZhdWx0KS4gSG93IGNhbiBJIHJlc29sdmUgdGhpcz8gRG9lcyBwaG9z
cGhvci1pcG1pLWhvc3QgdXNlIENNYWtlIG9yIEF1dG90b29scyBmb3IgY29tcGlsYXRpb24gYnkg
ZGVmYXVsdD8NCg0KQWRkaXRpb246IFdoZW4gY29tcGlsaW5nIHBob3NwaG9yLWlwbWktaG9zdCwg
dGhlIGRlZmF1bHQgcmVjaXBlIHBhcmFtZXRlcnMgZnJvbSB0aGUgT3BlbkJNQyB2Mi4xMi4wIGJy
YW5jaCBhcmUgdXNlZC4NCg0KU2ltdWxhdG9yIEVudmlyb25tZW50Og0Kcm9vdEBldmItYXN0MjYw
MDp+IyBzeXN0ZW1jdGwgc3RhdHVzIHBob3NwaG9yLWlwbWktaG9zdA0KKiBwaG9zcGhvci1pcG1p
LWhvc3Quc2VydmljZSAtIFBob3NwaG9yIEluYmFuZCBJUE1JDQogICAgIExvYWRlZDogbG9hZGVk
ICgvbGliL3N5c3RlbWQvc3lzdGVtL3Bob3NwaG9yLWlwbWktaG9zdC5zZXJ2aWNlOyBlbmFibGVk
OyB2ZW5kb3IgcHJlc2V0OiBlbmFibGVkKQ0KICAgIERyb3AtSW46IC9saWIvc3lzdGVtZC9zeXN0
ZW0vcGhvc3Bob3ItaXBtaS1ob3N0LnNlcnZpY2UuZA0KICAgICAgICAgICAgIGAtMTAtb3ZlcnJp
ZGUuY29uZg0KICAgICBBY3RpdmU6IGFjdGl2ZSAocnVubmluZykgc2luY2UgVGh1IDE5NzAtMDEt
MDEgMDE6MjM6NDYgVVRDOyA1cyBhZ28NCiAgIE1haW4gUElEOiAzMDUgKGlwbWlkKQ0KICAgICBD
R3JvdXA6IC9zeXN0ZW0uc2xpY2UvcGhvc3Bob3ItaXBtaS1ob3N0LnNlcnZpY2UNCiAgICAgICAg
ICAgICBgLSAzMDUgaXBtaWQNCg0KSmFuIDAxIDAxOjIzOjM3IGV2Yi1hc3QyNjAwIHN5c3RlbWRb
MV06IFN0YXJ0aW5nIFBob3NwaG9yIEluYmFuZCBJUE1JLi4uDQpKYW4gMDEgMDE6MjM6NDMgZXZi
LWFzdDI2MDAgaXBtaWRbMzA1XTogSlNPTiBmaWxlIG5vdCBmb3VuZA0KSmFuIDAxIDAxOjIzOjQ2
IGV2Yi1hc3QyNjAwIHN5c3RlbWRbMV06IFN0YXJ0ZWQgUGhvc3Bob3IgSW5iYW5kIElQTUkuDQpK
YW4gMDEgMDE6MjM6NDcgZXZiLWFzdDI2MDAgaXBtaWRbMzA1XTogTG9hZGluZyB3aGl0ZWxpc3Qg
ZmlsdGVyDQpKYW4gMDEgMDE6MjM6NDcgZXZiLWFzdDI2MDAgaXBtaWRbMzA1XTogU2V0IHJlc3Ry
aWN0ZWRNb2RlID0gZmFsc2UNCkphbiAwMSAwMToyMzo0NyBldmItYXN0MjYwMCBpcG1pZFszMDVd
OiBOZXcgaW50ZXJmYWNlIG1hcHBpbmcNCnJvb3RAZXZiLWFzdDI2MDA6fiMNCg0Kcm9vdEBldmIt
YXN0MjYwMDp+IyBuZXRzdGF0IC1hbiB8Z3JlcCA6NjIzDQp1ZHAgICAgICAgIDAgICAgICAwIDo6
OjYyMyAgICAgICAgICAgICAgICAgIDo6OioNCnJvb3RAZXZiLWFzdDI2MDA6fiMNCg0KSXNzdWVz
Og0KJCBpcG1pdG9vbCAtSSBsYW5wbHVzIC1IIDEyNy4wLjAuMSAtcCA2MjMwIC1VIHJvb3QgLVAg
b3BlbkJtYyAtQSBtZDUgbWMgaW5mbw0KRXJyb3IgaW4gb3BlbiBzZXNzaW9uIHJlc3BvbnNlIG1l
c3NhZ2UgOiBpbnZhbGlkIGF1dGhlbnRpY2F0aW9uIGFsZ29yaXRobQ0KDQpFcnJvcjogVW5hYmxl
IHRvIGVzdGFibGlzaCBJUE1JIHYyIC8gUk1DUCsgc2Vzc2lvbg0KDQokIGlwbWl0b29sIC1JIGxh
bnBsdXMgLUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG5vbmUgbWMg
aW5mbw0KRXJyb3IgaW4gb3BlbiBzZXNzaW9uIHJlc3BvbnNlIG1lc3NhZ2UgOiBpbnZhbGlkIGF1
dGhlbnRpY2F0aW9uIGFsZ29yaXRobQ0KDQpFcnJvcjogVW5hYmxlIHRvIGVzdGFibGlzaCBJUE1J
IHYyIC8gUk1DUCsgc2Vzc2lvbg0KJCBpcG1pdG9vbCAtSCAxMjcuMC4wLjEgLXAgNjIzMCAtVSBy
b290IC1QIG9wZW5CbWMgLUEgbm9uZSBtYyBpbmZvDQpBdXRoZW50aWNhdGlvbiB0eXBlIE5PTkUg
bm90IHN1cHBvcnRlZA0KRXJyb3I6IFVuYWJsZSB0byBlc3RhYmxpc2ggTEFOIHNlc3Npb24NCkVy
cm9yOiBVbmFibGUgdG8gZXN0YWJsaXNoIElQTUkgdjEuNSAvIFJNQ1Agc2Vzc2lvbg0K

--_000_TYZPR04MB7269BEB0CED686EFCA5833E3AFB5ATYZPR04MB7269apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you, but even after specifying -C 17 and upgrading to version 1.8.19,=
 there are still issues with the verification.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<b>Method 1:</b></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
$ ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 mc inf=
o -C 17</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Error: Unable to establish IPMI v2 / RMCP+ session</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
ipmitool -H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 mc info -C 17</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Error: Unable to establish LAN session</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Error: Unable to establish IPMI v1.5 / RMCP session</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<b>Method 2:</b></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
$ ipmitool --version</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
ipmitool: =CE=DE=D0=A7=B5=C4=D1=A1=CF=EE -- -</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<b>ipmitool version 1.8.19.0.gsnapshot</b></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
usage: ipmitool [options...] &lt;command&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Thi=
s help</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-V &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Sho=
w version information</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Ver=
bose (can use multiple times)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Dis=
play output in comma separated format</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-d N &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Specify =
a /dev/ipmiN device to use (default=3D0)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp;-I intf &nbsp; &nbsp; &nbsp; &nbsp;Interface to =
use</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
$ i<span style=3D"background-color: rgb(255, 255, 0);">pmitool -I lanplus -=
H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 session list</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Failed to initialize th=
e OEM info dictionary</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
$<span style=3D"background-color: rgb(255, 255, 0);"> ipmitool -H 127.0.0.1=
 -p 6230 -U root -P openBmc -A md5 mc info</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"background-color: rgb(255, 255, 0);">Failed to initialize th=
e OEM info dictionary</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> qiu din=
g<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA12=D4=C221=C8=D5 9:51<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=D6=F7=CC=E2:</b> ipmi issues(ubuntu 22.04 and openbmc v2.12.0)</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Hello, I'm testing the IPMI interface on the evb-ast2600 simulator with Ubu=
ntu 22.04 and OpenBMC v2.12.0. I'm encountering an IPMI authentication issu=
e (the port is 6230 -&gt; 623, and port 623 is listening on UDP by default)=
. How can I resolve this? Does phosphor-ipmi-host
 use CMake or Autotools for compilation by default?</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Addition: When compiling phosphor-ipmi-host, the default recipe parameters =
from the OpenBMC v2.12.0 branch are used.</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(200,38,19)">
<b>Simulator Environment:</b></div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
root@evb-ast2600:~# <b>systemctl status phosphor-ipmi-host</b></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
* phosphor-ipmi-host.service - Phosphor Inband IPMI</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;Loaded: loaded (/lib/systemd/system/phosphor-ipmi-host.=
service; enabled; vendor preset: enabled)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; Drop-In: /lib/systemd/system/phosphor-ipmi-host.service.d</di=
v>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`-10-override.conf</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;Active: active (running) since Thu 1970-01-01 01:23:46 =
UTC; 5s ago</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp;Main PID: 305 (ipmid)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;CGroup: /system.slice/phosphor-ipmi-host.service</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`- 305 ipmid</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:37 evb-ast2600 systemd[1]: Starting Phosphor Inband IPMI...</d=
iv>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:43 evb-ast2600 ipmid[305]: JSON file not found</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:46 evb-ast2600 systemd[1]: Started Phosphor Inband IPMI.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: Loading whitelist filter</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: Set restrictedMode =3D false</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Jan 01 01:23:47 evb-ast2600 ipmid[305]: New interface mapping</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
root@evb-ast2600:~#&nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
root@evb-ast2600:~# <b>netstat -an |grep :623</b></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
udp &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;0 :::623 &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:::* &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
root@evb-ast2600:~#&nbsp;</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(200,38,19)"><b>Issues:</b></span></div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
$ <b>ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A md5 mc =
info</b></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,0)">Error in open session respo=
nse message : invalid authentication algorithm</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,0)">Error: Unable to establish =
IPMI v2 / RMCP+ session</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,0)"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
$ <b>ipmitool -I lanplus -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc=
 info</b></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,0)">Error in open session respo=
nse message : invalid authentication algorithm</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Error: Unable to establish IPMI v2 / RMCP+ session</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
$<b>&nbsp;ipmitool -H 127.0.0.1 -p 6230 -U root -P openBmc -A none mc info<=
/b></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"background-color:rgb(255,255,0)">Authentication type NONE no=
t supported</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,&quot;Aptos_Embe=
ddedFont&quot;,&quot;Aptos_MSFontService&quot;,Calibri,Helvetica,sans-serif=
; font-size:12pt; color:rgb(0,0,0)">
Error: Unable to establish LAN session</div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Error: Unable to establish IPMI v1.5 / RMCP session</div>
</div>
</body>
</html>

--_000_TYZPR04MB7269BEB0CED686EFCA5833E3AFB5ATYZPR04MB7269apcp_--

