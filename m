Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2C4C9E9C
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 08:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7mTv4hzgz3bp0
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 18:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=gJIVy27+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com
 (client-ip=121.242.48.116; helo=inblrg02.tcs.com;
 envelope-from=prvs=05315de73=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256
 header.s=default2048 header.b=gJIVy27+; 
 dkim-atps=neutral
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7mTR2mSQz2yLX
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 18:48:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
 t=1646207341; x=1677743341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KXPCV9d+qqRhlZKJ05oN7G0/S9fwCAppUA7ndiGRjQU=;
 b=gJIVy27+BfhiWYYW6GR60ohkWwUJZaNmKwr2gqt1NBn3Ji1kpKHgj1KU
 xS8beZBDF3OPCoBbfgWph/qbBnTbTI81emQaj58Me+qoVhyvjzXVumviI
 SbAo4BSRhgrcfqzq9As2FpTY9p91+kaD6zaCJsZ8biBFRZ0Pp715XFIgm
 sYqc1AZHXPZtV99eIAWdNTMooHs3qjwF13+s1COiCiHj1C+eYcI0VqVA9
 WC21QGoNRqnznQB6bdD3ft0YTKyen1xV+802Ppgc2YXez1gT5YWqSoCy4
 zM/z4sMAl8+Z9p2oeARso60E3V56Dv0QQF2MFfvy8c9jKo3z4fPiGikp1 Q==;
IronPort-SDR: oU/rfmyZTkFnbekopaxrgDBWKlvHBVyLibv4GNyyZaySVadXrPwQkXs6Yej6CSuFoKcwN7LTML
 9QMmwkk+xIYA==
IronPort-Data: =?us-ascii?q?A9a23=3AX4SK0ajctV1+LNIANawx4qsWX161rBIKZh0uj?=
 =?us-ascii?q?C45NGQN5FlHY01jehtvWTyFaKmLMWb8eI1/a9m28xxUv8PQnIJgQQdpqS9nF?=
 =?us-ascii?q?S5Eo8PPWo3Ef039Ni6fd5XJEh824stBZImZIMprFSfX/Br8abKJQVuQdU2rq?=
 =?us-ascii?q?hgQMANOU8xIbVcMpBwJ1FQzy4bVvqYy2YLjW1nX5YuryyHiEATNNwBcYzp8B?=
 =?us-ascii?q?52r9UsHUMTa4Fv0j3RmDRx5lAa2e0o9UPrzEZqMw07QGeG4KAIYq9Hrl9lV9?=
 =?us-ascii?q?kuBl/sk50jMfrzTKiXmSZaKVeSCZ+Y/ZkSsvvRCjnRaPqcTFdw2TX17rw2so?=
 =?us-ascii?q?/kroDlPncXvE0Fwb+uVyb9bCkcHe819FfQuFLvvOnG5vcGe1wvecGbpyu9GE?=
 =?us-ascii?q?Eote4Yf/46bBEkVqKFFcWxQM3hvgMrzmtpXUNJEhN4uPeHvPYUCqjdhxzSfB?=
 =?us-ascii?q?vEjKbjEW6jM79pT9DMxndxVW/HMY8MTcnxodhuoXvHlEj/7E7pnw73u3yi5K?=
 =?us-ascii?q?mwD7gvL+sIKD6Ho5FQZ+NDQ3BD9IbRmnfloo3s=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ap/yZjam5YGQlNTCVGiCz6992eT3pDfNYiW?=
 =?us-ascii?q?dD5ihNYBxZY6Wkfp+V7ZYmPE7P+VUssS8b+exoYJPwME819fZOkPAs1MSZLX?=
 =?us-ascii?q?nbUQqTXcNfBOTZskDd8kHFh4lgPOJbAtZD4dDLZmSS7vyKpTVQcexQvOVvmZ?=
 =?us-ascii?q?rA7YqzoBkNPGQaD52IrT0JdTpzencGGzWubqBJbKZ0k/A33QZIDk5nFfhTaE?=
 =?us-ascii?q?N1OdQqe7Xw5cPbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2XTZkiTij5?=
 =?us-ascii?q?/T982T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfr2?=
 =?us-ascii?q?rC0eO85SvIDf4Ds085TVvF+icFHDOQigrG3kWSkGNwR0GT/PARCghKV/apzr?=
 =?us-ascii?q?gpAScxo3BQzu2Ulpg7gV6xht5tISv8uR6V3bL1vlhR5zyJiGtnmeQPj2NeTJ?=
 =?us-ascii?q?sEZLVWtoF3xjIgLL4QWCjz8oVPKpgaMOjMoPlRal+UdHbfoy1mx8GtRG06Gl?=
 =?us-ascii?q?OcTlEFodH96UkWoJlV9TpW+CUkpAZPyHv9cegP283UdqBz0L1eRM4faqxwQO?=
 =?us-ascii?q?8HXMusE2TIBRbBKnibL1jrHLwOfyulke+13JwloOWxPJAYxpo7n5rMFFteqG?=
 =?us-ascii?q?4pYkrrTcmDxodC/BzBSHi0GT7t1sZd7Z5kvaCUfsuqDQSTDFQ118ewqfQWBc?=
 =?us-ascii?q?PWH/61JZJNGvfmaXDjHI5YtjeOF6W66UNuHfH9luxLE25m+Pi7Y7ECntarO8?=
 =?us-ascii?q?r7Nf7qGz4lVwrEcww+YAQ=3D?=
X-IronPort-AV: E=Sophos;i="5.88,393,1635186600"; d="scan'208";a="35551455"
X-DISCLAIMER: FALSE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt1hmpWPCw6Vbw0u+GcX6o3e3KjydvE1UHqxVWjbq61tYOjOMzOQFw5cJaE0Sm57O7w45h/S4C01SOFu1cT8TOJFqwiVauuF1vk6l4HomnLosdJ43x3hLksDO8HquQgMU1CB7zzbRMJj2jml2Z++MHnhEi5j9HDFMsrdLes5muObs5AHtKfgMkw25K1E9vTaGri4pbyZcYHDJI0SrQEr1QHUoCnyUxUo835GgUtYoqhIf4SiWCrVoGWo+Kaopc6jIeEAjWYiOCpXYjUsV4oPk1ApFZF8xn0f7Eh4DQmy8b5swQ+gRxzfxSCwR6ToEbRSr8ULzFhG7VZMcpjSYFpcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXPCV9d+qqRhlZKJ05oN7G0/S9fwCAppUA7ndiGRjQU=;
 b=Tcg1wt31QkoxkTT9A7npWUi/4D/EiPvZ0YVH99hTsd2lCG0rpiQmOrRjiAkKivjNKiMBnz+EmLZxv9sscbKPHcIU6qk6QAQGgNxmFqIdjAGJQ8O5rnH5CsO9qbEuTg/p6aPvZleH2Gf5ADmcfLMhNJYO9IYVC2LNOgAmXxC3Ss90kMaSPnJxTGZdHL8wSpgNADc4fFVsIDXwyWeh4cjUd5WLntZ10IZB9k4eYJO8dbGahwMniQKg5UB3IRzdDtk2lfRbWIPsbHwAo9NxtamPT0SYF3ux25Ycy6XLYz010nscMTH04cfwofy4KL3jH15bvj5GSBhq+807DlYO030YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: RE: openBmc Code Structure
Thread-Topic: openBmc Code Structure
Thread-Index: AdgqEnoKusptz7YpTwiYMV2le+cEdgAOX80AANcv9IAAGEdhwA==
Date: Wed, 2 Mar 2022 07:48:19 +0000
Message-ID: <MA1PR01MB412934D968981610DCEA616087039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB41290C4B84DDFB7ABD101CB7873E9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <CE613404-79EA-4D39-816D-B16E757CB64A@gmail.com>
 <a81d2232-e0bf-e9f8-893a-833a7e29f6a3@linux.ibm.com>
In-Reply-To: <a81d2232-e0bf-e9f8-893a-833a7e29f6a3@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2cf577c-4575-467d-5221-08d9fc21051c
x-ms-traffictypediagnostic: MA0PR01MB6938:EE_
x-microsoft-antispam-prvs: <MA0PR01MB6938C1B3489D5A78F2CF22C087039@MA0PR01MB6938.INDPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUvUE7GIMnIBee3CiIEoVW6xhdj08I5a/KqLo7XxBgQWMnEMfGe0nTw/FwlEW0jc4/Wn2GRuySFKQPOilevOYWuInBxon6we6VZAw5QBUolO3AKCH/KIGEgW7x+6c/5HRwxZV3Clv1C5zytqsedTiMHM/+bT25OlXrlN8LUI0nRrHNw8LT5KPKlcJw9aZqaa9HP4r/7ZmW+RTLFcH/xgkzF4QDzr0sGM8yFagIQFzOU7CQO8sC5PfY6it2l1/NTGlxXIqGNQZYw3BB1lJ8FWId0g8kZh0VQWx9ntlTkoqGkrPiWMMAfWqx6NYhWV7IjgCoF8BxB0PDAK+jiJ6+z1I/eYfouSIfe74UsxZukkeCcU+TzBvBUJHOyf9nPq8Q0pbgyFwRRdJTSZYntTHBAeBzl0igoZijGjcWCdnH0z75ENMgLe7FLf86dwZ0ECMn9rS9Vd5rvgbNzI6kInZ9Rc4QmlTBr+RC4PHIBL8Hdqdnbx4jCcDH4oRtUlvct2/x0BFZRWSAhgXi2KZtLTYKzA2UonjTdqyF5lEXhBMp7emajyA1RS+myNSF64m5Kt/5cajVyLFPxKpcGfihUEOvftHkZMWKpZ296oU8uVJQDL7YadhsJrW+lia54AWJYaDETFp6M1lILlrxetaXNdFwXnHC4G9uNDRYNUhGZ1dk90xJny0EC87Gx0yDmAfou50XOEQ3J0iDFpdVRrK6YySi54c05ZNUjDDXN3MexA9D8vokXPv09Y3ePTfyQ8VqQYHyfAOtJQlsxK9cX6wDE6Pp5/a4DUv9we8d7AuUmvdCTB37M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(86362001)(33656002)(6916009)(5660300002)(186003)(26005)(508600001)(55016003)(8936002)(38070700005)(52536014)(71200400001)(6506007)(76116006)(8676002)(3480700007)(38100700002)(9686003)(7696005)(82960400001)(4326008)(66476007)(83380400001)(66446008)(66946007)(64756008)(53546011)(66556008)(55236004)(122000001)(316002)(7116003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFxSVU1Z1FkNGV0UDdLU083ZjNmYXgyUjNQMTJMWUdZMDEweHppUEN4TFR6?=
 =?utf-8?B?TzhJWFhZZG5uV0tRNm1rWEdRRlVYTGIxVGlxZ3JObXVuN2JsSkZLZ1JHb2ZL?=
 =?utf-8?B?bkNXL2UwcFRkV2tLNXhFQXpTWnRyQ1g5Y2tXSWtKdXE5MVZyaEJxek81L2N5?=
 =?utf-8?B?ck5zVEtOSXN6Z2ZSRk1XM25lVzBKekRsL1JCcDhyL2NHUlZ4ak1wa3h0Ukdt?=
 =?utf-8?B?RHdYbk1uZ2dQemI2aE5aQVNNNEEzWGx2bDVKQVFVM20reUxEb3cvUUFiVTA4?=
 =?utf-8?B?ZS9jdURYekxjbFh1VjRQb0dQZk5XUGxUclVsZ2xuM2hESlg3cHNRTnVMWDdV?=
 =?utf-8?B?Ujh4UHNiMlV6c1g0dkFnNWR1ZUN3MDdFWis2WHFFcHozRGIzemlkVHpERFBm?=
 =?utf-8?B?akU3VmVubytHSXRJWFlOMmZGZ0FiaC9EK0xTVmJHK1czOURQbUJqQ1lPQnNx?=
 =?utf-8?B?eGRlQlcxS2VCcFBmbVk0eGhnRU5wYkloOU9tT0ZhRlNzS0RKR25TWi9RSEVP?=
 =?utf-8?B?amdZc1dFTUdWWWVrZDBWUUZNUDVRN1kxZ203aExudmtDZ3E2ckg5UXo3a2Z5?=
 =?utf-8?B?d3gydUErMExSMVlPbWVqV1B5S1V5NEJ3ZmhVTmVUVFFqZEpzRWdQZGpFZmpk?=
 =?utf-8?B?M2x0eU9Ua2FrUXVXNFNKNzBtdXNOaFNjZnQ3ZnR5ZUZkazlUWGExMXJiZ1Fz?=
 =?utf-8?B?OXZmZWdIcTh3aU5VY2Fkd2NNNzkxMnZhZjBMMnZvMzBoSFRUZmJtWE80UUwv?=
 =?utf-8?B?RlRuZGJ5N3dqUDUzZ0lLbm1nNm9Td0s0a2ZwVDYvdU4yck05bzA2NkJ1YnlY?=
 =?utf-8?B?MlUvMmY0YkpXNkQ2b2FhYTZLbnU0MHlObEN1T0VKeDlSNFNWcHlRUzlnQTlX?=
 =?utf-8?B?aThtSjJoUTkyNGRNS0huaUVhQStaK2haN2R6U00yVjlGUnRtcjJTYU5mN0th?=
 =?utf-8?B?VVhLRkVDeTNHcWNYMEZjb1ZOMXZTaVlkbDFPdU94SEFORDhPSDdwWURPOEpC?=
 =?utf-8?B?RWw4OGZwTEUxdWFGdUhsSE9PcndoSlFZc2ZueUZZWU1MeDcwWEpYR2MvSHdH?=
 =?utf-8?B?ai85UmZ4VlI2amJRNnQ1RjlYaDZoT1JlbTJ3Yjgrc1VGR2FObVBvOUdxaWc4?=
 =?utf-8?B?aTA2bWlPSHRZSWIxdTA5MTk5QnNYMCtHQ1VkZFZBLzFEcU1mOFBxNlhmSHVh?=
 =?utf-8?B?MHpJYWpzVkFWNDhSUy9RMlZWKzRMZXMzM1dnRTBPNytLVDNFOFM0YWV2d0x6?=
 =?utf-8?B?c29RbzR2V3dnUFI0RWdlYUJpdjk0MkQrdFhJTkQ4UlFMVnNRSzlsMXdMOTc4?=
 =?utf-8?B?bThHeTgvSW9UV2JHcW1oc0ZZVUVld1FFdXg5RGdjMjJoRXp4Smg3ZWNYMThp?=
 =?utf-8?B?dlh4QjVNTFhWUm0vUVNFWXlRUnREWUM3ZXpIYWtmMVk0RDQzdzJ4Z1doZGUr?=
 =?utf-8?B?ZytyK3d5a01uTFVCbGNLZzJlQW1HOC9wTUoydDhpN1NML2hIY2NiMXo4dWpB?=
 =?utf-8?B?QjlyVmk0RnBPOTIyVzRiNkxSUFhxckxJUStGVHRHdksydDIvVVluTFRXdmwr?=
 =?utf-8?B?a0lvOHhSR1pITzZZMEVUVDE5Q1RmT2w4dU1YUE9BUkJGQ2dVdWhzcEhGQkt0?=
 =?utf-8?B?VXhNMy9xTEo3dVpQdEpUekFFcWZSckJXOTFQNjZhUlJoSk5vYkdqQnMwOGd4?=
 =?utf-8?B?RTdBWk81aC9INUh2SmZaRGdSVGNzbEovU21IZ0FBdU1rcXNWOXhsRVRRM0ZZ?=
 =?utf-8?B?L0Z4S2dYampIUVE3QTloU1dpT0tHVDdmYlJxQnV4a3g1S2JwQ2gxckNHVVhB?=
 =?utf-8?B?aGV4NHgrRzFHVGg0alNtMnJ2cUVqU095Z1ZiKytNZ2FGR1ZqM0VwT0pnOWRF?=
 =?utf-8?B?cFhaZkRtNi9KM0J6Y1kzOXBrZmdKeVkvVDZKTEJsaTRQOGdNL1BaOFU1dkZD?=
 =?utf-8?B?c2F4SFVxTVFnT1hhUUMwODdzekwzM2R0aXN0NWxrQUsxV3R0SkJaZzNBMS8w?=
 =?utf-8?B?MTVTQ05OUzJvdzFaOUpsVVRkdk9HQjdkWWN0RDhremgyNmY3U2JCSG1jSm1a?=
 =?utf-8?B?SjVlWFowamxpUHpTN3A2VGZPVHpjb2tvbHJ3MTJkeHRUZ1FmcVpVVE0xc0hp?=
 =?utf-8?Q?VHC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cf577c-4575-467d-5221-08d9fc21051c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 07:48:19.8717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+Yx/HfEN887U1z5hRF2Pw+9vBIwKrBmA/hPHFxbMYWJY0GKHrrnpnm03fs0/7Hz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6938
X-OriginatorOrg: TCS.COM
X-TM-SNTS-SMTP: F7FA7D14369C3979944EDF539EE3AE2A1ABBE1FCD6D4BB8025559E61AD373E9D2000:8
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

SGkgSm9zZXBoLA0KDQpUaGFua3MgZm9yIGEgdmVyeSBjbGVhciBleHBsYW5hdGlvbi4gSSBhbSBt
b3JlIGludGVyZXN0ZWQgaW4gb3BlbkJNQyAgY3VzdG9taXphdGlvbiBsYXllcnMuIEFsc28sIHdv
dWxkIGFwcHJlY2lhdGUgc29tZSBpbmZvIHJlbGF0ZWQgdG8gcmVkZmlzaCBtb2R1bGVzLCBuZXcg
QVBJIGNyZWF0aW9uLCBldGMuICBNb3JlIGluZm9ybWF0aW9uIG9uIHRoaXMgd291bGQgaGVscCB1
cyBpbW1lbnNlbHkuDQoNClJlZ2FyZHMsDQpTYW5kZWVwLg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSm9zZXBoIFJleW5vbGRzIDxqcmV5QGxpbnV4LmlibS5jb20+IA0KU2Vu
dDogV2VkbmVzZGF5LCBNYXJjaCAyLCAyMDIyIDE6NDMgQU0NClRvOiBNaWtlIEpvbmVzIDxwcm9j
bGl2aXNAZ21haWwuY29tPjsgU2FuZGVlcCBLdW1hciA8c2FuZGVlcC5wa3VtYXJAdGNzLmNvbT4N
CkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBvcGVuQm1jIENvZGUg
U3RydWN0dXJlDQoNCiJFeHRlcm5hbCBlbWFpbC4gT3BlbiB3aXRoIENhdXRpb24iDQoNCk9uIDIv
MjUvMjIgNzozMSBBTSwgTWlrZSBKb25lcyB3cm90ZToNCj4gU2FuZGVlcCwgSSB0aGluayB0aGF0
IGlzIGxpa2UgYXNraW5nIHdoYXQgdGhlIHNvdXJjZSBjb2RlIHN0cnVjdHVyZSBvZiANCj4gYSBs
aW51eCBkaXN0cmlidXRpb24gaXMuIE9ibWMgaXMgYnVpbHQgZnJvbSBhIGxpbnV4IGtlcm5lbCBh
bmQgbWFueSANCj4gYXBwbGljYXRpb24sIGVhY2ggd2l0aCBpdOKAmXMgb3duIHN0cnVjdHVyZS4g
SeKAmW0gc3RpbGwgbGVhcm5pbmcgT0JNQyANCj4gbXlzZWxmLCBidXQgSSB3b3VsZCBsb29rIGF0
IHRoZSBvYm1jIFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydCBUaGlzIA0KPiBNZXNzYWdlIElzIEZy
b20gYW4gRXh0ZXJuYWwgU2VuZGVyIFRoaXMgbWVzc2FnZSBjYW1lIGZyb20gb3V0c2lkZSB5b3Vy
IA0KPiBvcmdhbml6YXRpb24uDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gU2FuZGVlcCwN
Cj4NCj4gSSB0aGluayB0aGF0IGlzIGxpa2UgYXNraW5nIHdoYXQgdGhlIHNvdXJjZSBjb2RlIHN0
cnVjdHVyZSBvZiBhIGxpbnV4IA0KPiBkaXN0cmlidXRpb24gaXMuIE9ibWMgaXMgYnVpbHQgZnJv
bSBhIGxpbnV4IGtlcm5lbCBhbmQgbWFueSANCj4gYXBwbGljYXRpb24sIGVhY2ggd2l0aCBpdOKA
mXMgb3duIHN0cnVjdHVyZS4NCj4NCj4gSeKAmW0gc3RpbGwgbGVhcm5pbmcgT0JNQyBteXNlbGYs
IGJ1dCBJIHdvdWxkIGxvb2sgYXQgdGhlIG9ibWMgZGVzaWduIA0KPiBkb2NzIGFuZCBsZWFybiBp
dHMgYXJjaGl0ZWN0dXJlLCB3aGljaCBpcyBiYXNpY2FsbHkgYSBkYnVzIHN5c3RlbSB3aXRoIA0K
PiBzZXJ2aWNlcywgYW5kIHRvIHRoZSBvdXRzaWRlIHdvcmxkLCBSZWRmaXNoLiBZb2N0byBpcyB0
aGUgZ2x1ZSB0aGF0IA0KPiBtYWtlcyBhIGNvbXBsZXRlIGltYWdlLg0KPg0KPiBNaWtlDQo+DQo+
PiBPbiBGZWIgMjQsIDIwMjIsIGF0IDExOjQyIFBNLCBTYW5kZWVwIEt1bWFyIDxzYW5kZWVwLnBr
dW1hckB0Y3MuY29tPg0KPj4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+PiBJIGhhdmUganVzdCBzdGFy
dGVkIGxvb2tpbmcgaW50byB0aGUgb3BlbkJtYyBzb3VyY2UgY29kZS4gQ291bGQgDQo+PiBhbnlv
bmUgZXhwbGFpbiB0aGUgc291cmNlIGNvZGUgc3RydWN0dXJlIGZvciBvcGVuQk1DPw0KDQpIZXJl
IGlzIGhvdyBJIGV4cGxhaW4gaXRzIG1vc3QgYmFzaWMgc3RydWN0dXJlOg0KT3BlbkJNQyBoYXMg
YSBjb21wbGV4IHNvdXJjZSBjb2RlIHN0cnVjdHVyZS7CoCBJdCB1c2VzIHRoZSBiaXRiYWtlIGJ1
aWxkIHN5c3RlbSB3aGljaCBydW5zIG9uIHlvdXIgYnVpbGQgaG9zdCBhbmQgcHJvY2Vzc2VzIHJl
Y2lwZXMgdG8gcHJvZHVjZSB0aGUgZmlybXdhcmUgaW1hZ2UuwqAgSW4gdGhpcyBzZW5zZSwgdGhl
IE9wZW5CTUMgc291cmNlIGNvZGUgY29uc2lzdHMgb2YgYSBzZXQgb2YgcmVjaXBlcy7CoCBBIHR5
cGljYWwgcmVjaXBlIHRlbGxzIGJpdGJha2UgdG8gZmV0Y2ggYSBwYWNrYWdlLCB1bnBhY2ssIHBh
dGNoLCBhbmQgY29uZmlndXJlIGl0LCBhbmQgYnVpbGQgaXQgaW50byB0aGUgZmlybXdhcmUgaW1h
Z2UuIEluIHRoaXMgc2Vuc2UsIHRoZSBPcGVuQk1DIHNvdXJjZSBjb2RlIGNvbnNpc3RzIG9mIHRo
ZSByZWNpcGVzIGFjdHVhbGx5IHVzZWQgdG9nZXRoZXIgd2l0aCB0aGUgcGFja2FnZXMgdGhleSBm
ZXRjaC7CoCBOYXR1cmFsbHksIHRoZSBleGFjdCBzb3VyY2UgY29kZSB1c2VkIGluIGFueSBnaXZl
biBidWlsZCBkZXBlbmRzIG9uIHdoaWNoIHZlcnNpb24geW91IGFyZSBidWlsZGluZyBmcm9tIChh
cyBkYWlseSBjaGFuZ2VzIGFyZSBtYWRlIHRvIHRoZSBtYXN0ZXIgYnJhbmNoKSBhbmQgd2hpY2gg
cGxhdGZvcm0geW91IGFyZSBidWlsZGluZyBmb3IuDQoqIFRoZSBkb3duc3RyZWFtIGZsb3cgZm9y
IHRoZSByZWNpcGVzIGlzOiBPcGVuRW1iZWRkZWQgLS0+IFlvY3RvL1Bva3kgDQotLT4gT3BlbkJN
QyAtLT4gSUJNIHByb2R1Y3QgZm9ya3MuwqAgKERldGFpbHMgZm9yIElCTSBwcm9kdWN0IGZvcmtz
IGFyZQ0KYmVsb3cuKcKgIEVhY2ggcHJvamVjdCBhbG9uZyB0aGUgc3RyZWFtIGN1c3RvbWl6ZXMg
dGhlIHJlY2lwZXMgYW5kIGFkZHMgbmV3IHJlY2lwZXMuDQoqIFRoZSBPcGVuRW1iZWRkZWQgKE9F
KSBwcm9qZWN0IGlzIHNlbWluYWwuwqAgSXQgcHJvdmlkZXMgdGhlIGJpdGJha2UgdG9vbCBhbmQg
cmVjaXBlcyBmb3IgbWFueSB0aG91c2FuZHMgb2Ygb3BlbiBzb3VyY2UgcHJvamVjdHMuDQoqIFRo
ZSBZb2N0by9Qb2t5IHByb2plY3QgaXMgZG93bnN0cmVhbSBmcm9tIE9FLsKgIEl0IG9yZ2FuaXpl
cyB0aGUgcmVjaXBlcyBpbnRvIGEgTGludXggZGlzdHJpYnV0aW9uIHN1aXRhYmxlIGZvciBlbWJl
ZGRlZCBzeXN0ZW1zLg0KKiBUaGUgT3BlbkJNQyBwcm9qZWN0IChodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy8pIGlzIGRvd25zdHJlYW0gZnJvbSBQb2t5LsKgIEl0IGFkZHMgQk1DJ3Mgc3BlY2lh
bGl6ZWQgZnVuY3Rpb25zIGluIGJpdGJha2UgbGF5ZXJzOg0KIMKgwqDCoCAtIG1ldGEtcGhvc3Bo
b3IgKGFuZCBvdGhlciBsYXllcnMpIC0gcHJvdmlkZSBjb21tb24vY29yZSBCTUMgZnVuY3Rpb24N
CiDCoMKgwqAgLSBtZXRhLW9wZW5wb3dlciAtIGFkZHMgc3VwcG9ydCBmb3IgT3BlblBPV0VSDQog
wqDCoMKgIC0gbWV0YS1pYm0gLSBhZGRzIHN1cHBvcnQgY29tbW9uIHRvIElCTSBzeXN0ZW1zDQog
wqDCoMKgIC0gbWV0YS13aXRoZXJzcG9vbiAoYXMgYW4gZXhhbXBsZSkgLSBhZGRzIHN1cHBvcnQg
Zm9yIHNwZWNpZmljIGhvc3QgbWFjaGluZXMNCg0KQXJlIHlvdSBtb3JlIGludGVyZXN0ZWQgaW4g
dGhlIFlvY3RvL2JpdGJha2Ugc3RydWN0dXJlLCBvciBpbnRlcmVzdGVkIGluIHRoZSBPcGVuQk1D
IGN1c3RvbWl6YXRpb24gbGF5ZXJzPw0KDQpKb3NlcGgNCg0KPj4gVGhhbmtzLA0KPj4gU2FuZGVl
cC4NCj4+DQo+PiA9PT09PS0tLS0tPT09PT0tLS0tLT09PT09DQo+PiBOb3RpY2U6IFRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSBhbmQvb3IgDQo+PiBhdHRh
Y2htZW50cyB0byBpdCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZv
cm1hdGlvbi4gDQo+PiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBhbnkg
ZGlzc2VtaW5hdGlvbiwgdXNlLCANCj4+IHJldmlldywgZGlzdHJpYnV0aW9uLCBwcmludGluZyBv
ciBjb3B5aW5nIG9mIHRoZSBpbmZvcm1hdGlvbiANCj4+IGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIGFuZC9vciBhdHRhY2htZW50cyB0byBpdCBhcmUgDQo+PiBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGNvbW11bmljYXRpb24gaW4gDQo+PiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB1cyBieSByZXBseSBlLW1haWwgb3IgdGVsZXBob25lIGFuZCBp
bW1lZGlhdGVseSANCj4+IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFu
eSBhdHRhY2htZW50cy4gVGhhbmsgeW91DQo+Pg0KPg0KDQo=
