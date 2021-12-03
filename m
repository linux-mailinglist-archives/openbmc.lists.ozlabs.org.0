Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B1467DBE
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 20:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5Mhq6Mflz3bNB
	for <lists+openbmc@lfdr.de>; Sat,  4 Dec 2021 06:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=H+z8bHKW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.42.83;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=H+z8bHKW; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2083.outbound.protection.outlook.com [40.92.42.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5MhP74ZBz2yph
 for <openbmc@lists.ozlabs.org>; Sat,  4 Dec 2021 06:04:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFklqkJiBipq4jWF8cA17hkaVys0jfOytY3v2HwN2XaJBf8hsQinW+695fQqIzfUuJcviMjH3kwroE9hHIGzz286WZ/gSmwS4v3pShiHJTAJzTV1CumBSOJ7WgJxxgmeccpLewmZzgx4Hb2jEkZsJe7GAgwpySAUXCcESS9pJwIDOBtT466T0HW8oODSNW1SYzLbr/wVKcOGRbmkCzboZ+q9oruCZ325v+cFYDMH/xO/1gsU4h2vY80wXa1HaCiwd6RKo7vylRpZQRGzC71qQPicVng/sLZDzIqO2pGn4fFaIYbI3cNNIJ0VoUc26wFnzI7b6YIY8VSbyaiPvlGlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p58CXrVnTdfuoioLEYiSDvTn+JRvIMFBkSrteAAJEug=;
 b=CMGZrHTRHQV6VM0UsKAiKgPF4hBhHeKcD6UbXfkIOrAesTPPgrT14UGqJSSSIFdsveSGOyfnEAVQLYhTZjsVTI5JMdtONNgHkVK4f36bAdVLSKQUZ1RCqr0OnLicqZiEdOQDrTwNAlT7igrN5fgZ1V28FOQpp41g1sRg2LTq1JxofROJiNCriYFpWGWZlvbN89vNR3xXT24G+okt36CXnSa3GIPyPRm+OaLFn/oRzCEytb9YkYttp4rifO7mh1EpBcaGzJ081HJTUgmE/sBreO5sasrerv7HNkkCn8sD0s774Zvd3tgj77R2s2ustKQZ78rtYXoL70ppofuirxeaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p58CXrVnTdfuoioLEYiSDvTn+JRvIMFBkSrteAAJEug=;
 b=H+z8bHKW7GskJcLN8jtXOlLjT3N6km3o3yJPDsXlibQxih6EnTpdjgiFTfEz3H08LT52JKwbug/ktl5HOnsZHyDLY4UQAe8Hlhmejo0JMIh1RPH7S99eKuko90fSzdqE07Qv6K9+pDC9wXJ9IAUqMP/gwZwLlF6XTyVV7J7mJzq1/clAIqjcNzZUAQLsjBXiHfaj6N9gvMGaOIKTK8O9kcDt2dtWbJGmaIMZbnOSkf9DE2+qHc6nHgD2rNwBAIQ9abr7Oy+sve6IB4zSLEI4e1YDz+dfhv3Bdj9TJyBuhKdWfJh0/fbnzWXVZH4VppjEDtxh15QflkB3v85y23D/mg==
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com (2603:10b6:a03:376::7)
 by BYAPR14MB3175.namprd14.prod.outlook.com (2603:10b6:a03:d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 18:31:45 +0000
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::855b:40a8:8bd1:3a3e]) by SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::855b:40a8:8bd1:3a3e%9]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 18:31:45 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Any cmdline tools to modify DBus
Thread-Topic: Any cmdline tools to modify DBus
Thread-Index: Adfoc1KRRnzGloZ9RVOnQZdSCvUk9w==
Date: Fri, 3 Dec 2021 18:31:44 +0000
Message-ID: <SJ0PR14MB48051F038B0094EDF6662CCDDC6A9@SJ0PR14MB4805.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [eVTeabs7C0FgEF3TmZx4JJMgxxYUQ4UX]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e41b88-16da-4941-5baa-08d9b68b28f2
x-ms-traffictypediagnostic: BYAPR14MB3175:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o7OoSAY4Cf5+eBoEIBD1BXAg5Iw6xrWA1FXPBrrZmV3x9T6g2/sonLQH+eOC4N41ebM4XejSt989W1DAZgHn24sw+XoL3QLGpLL2r6jSjhtixmKw2ayozUDFV1pXk48b9rFJcPnxz5ckP/Eg9ZRPGHarREoIItONLutYr1LSwu8hCpWu6llsY4pkr7zDgQt14rJuZfZt01UHmuHD1KlOymNrdW1DJ9MqN9FFwGBDeKefomPJ18BmsrOQr4KIyeJ8Dl48L0Tz7fksAOnhF+UFpjLkiDmv5FgZK0iBn0wEyiXr8BqNQ9qA2zOO/LndWPwZUU7e3l1simdv4tGN62OzHsk5Jsc2rjQttmIRn+HEIcClf97l85CLIKsZVj8L2/fYEVVUjv5Tj91ubvwsKwa4VJxI8kIJLp2fgI4oK0URpRotmT3RLSU9W70I3tpn1yNr35PZZ2m/UQPSq2BX9qCZm0YjkdsDM+xSP8UHancH1b3mTqWpTiZNKFPsDzyLiSPAFDsSdzVJf93JZzvmMW7SUaaq8fFI+KwMvXsyao0n8h5L4Hc44VGVvD0hte8FRIolAWLi8ivzBmSOnzEmz+imjQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: gG6IOYbVmh4oJGTB7DJgKdXv0xU8PDz2dV26LV/Arlj8pMYKdymjtVKqxRcQTErDpc1fqBZ8iTq11ZttqkJAB/DI9xzf0B6R1e8ICERFqZILkYP2NAkeHwNhrSymkEbDNFFhiRh8yyjljNG4/UqAZSqz22YaQ71DLkRwVDfbss/QuFv3MkPv1vwAhgHTY5LJquH8+CzncyNVPUI401HXppav3oaTO34PnTc19cXrUCinnKFABROyMv+X8DOzmdEOwtjPAfdGI8AAtUAUq9KIt207NPlSvsIGyCaw+ELmg9iEszhpd/0xy+7RD9qAicQbujKm0JbA757T1gH8E3NVgMY2MPxrR8yAfgjtd//m01W6WMZsGtTrHgqs0FzTUjB3GxP0Aby5sKesRv8/mO2t6OtTgXjhL+Ma7TMqL7slUHBBbGkIpEtUs61txoPp6R8pQXWNg1vSLEGBPHEYUvtR20HISPpLu/V56f1Yj7dnZQDiKziE71+bRnPP+Gqy9ya2LX6FlND8OrdaGHriRFjFbp77KeHFNiUij2wDpVwBMliIHg4YV00pvPftOqjcpD7KgWZg6K87XyVDsp3QoLhFiLyBkpZ44Tynq0tlG7lXbE5LBs5ED8YGz+N/l2As2prdAB30L07EHxOdcY/+NAOi+Bp/QpijUYuY9LvZYWvko0WCY5C0S5pv30nJnUDvFMYfpcid7s6a0a7DPk9y/qte+xYaKDg5lEEEaS1zMyXgcWOTVfbC86UjdospaedEwThIK1d9U8YNBO8bQYLjoZKZp6KTZ1dFQMw6RBDyfohUAYrgihDu3FFErd4W/fDgY0IYaq/qoVYgIVNI/98eXJEhlvBaYBuBHT5ZvAtTHtMGmJl96fCOu+ylvYY6jpltmTHR98IOQDFWxIu95qZNV7HN/YU/jcBcYnjrTT7v02A/3lyVa+bTSflBlPli+Hvr8ACP
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR14MB48051F038B0094EDF6662CCDDC6A9SJ0PR14MB4805namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-32894.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR14MB4805.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e41b88-16da-4941-5baa-08d9b68b28f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 18:31:44.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR14MB3175
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

--_000_SJ0PR14MB48051F038B0094EDF6662CCDDC6A9SJ0PR14MB4805namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGVhbSwNCg0KSXMgdGhlcmUgYW55IGNtZCB0byBjcmVhdGUvZGVsZXRlIGludGVyZmFjZS9w
cm9wZXJ0eSBvZiBleGlzdGluZyBEQnVzIG9iamVjdHMgY3JlYXRlZCBieSBvdGhlciBzZXJ2aWNl
cz8gTG9va2luZyBmb3IgYW4gZWFzaWVyIHdheSB0byBxdWlja2x5IGRvIGl0IGZvciBkZWJ1Z2dp
bmcgaW4gZWFybHkgZGV2ZWxvcG1lbnQgcGhhc2Ugd2l0aG91dCBjb2RpbmcuDQpQbGVhc2UgYWR2
aXNlLg0KDQpUaGFua3MsDQpLdW4NCg==

--_000_SJ0PR14MB48051F038B0094EDF6662CCDDC6A9SJ0PR14MB4805namp_
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
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21w
b3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3Rl
eHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3Np
emU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBUZWFtLDxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5JcyB0aGVyZSBhbnkgY21kIHRvIGNyZWF0ZS9kZWxldGUgaW50ZXJmYWNl
L3Byb3BlcnR5IG9mIGV4aXN0aW5nIERCdXMgb2JqZWN0cyBjcmVhdGVkIGJ5IG90aGVyIHNlcnZp
Y2VzPyBMb29raW5nIGZvciBhbiBlYXNpZXIgd2F5IHRvIHF1aWNrbHkgZG8gaXQgZm9yIGRlYnVn
Z2luZyBpbiBlYXJseSBkZXZlbG9wbWVudCBwaGFzZSB3aXRob3V0IGNvZGluZy48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBsZWFzZSBhZHZpc2UuPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlRoYW5rcyw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkt1
bjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_SJ0PR14MB48051F038B0094EDF6662CCDDC6A9SJ0PR14MB4805namp_--
