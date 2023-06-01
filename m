Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217F57196AE
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 11:18:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX0tQ5mbkz3dsx
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 19:18:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=ejFHKYmL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=122.184.60.32; helo=inchng03.tcs.com; envelope-from=prvs=509b5236e=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=ejFHKYmL;
	dkim-atps=neutral
X-Greylist: delayed 70 seconds by postgrey-1.36 at boromir; Thu, 01 Jun 2023 19:18:07 AEST
Received: from inchng03.tcs.com (inchng03.tcs.com [122.184.60.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX0sq6NwGz3cdK
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 19:18:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1685611088; x=1717147088;
  h=from:to:subject:date:message-id:mime-version;
  bh=QUADEMXlE07lapQs1a7lD9jZVfKunSHJ8rCODU1n1dE=;
  b=ejFHKYmLsSgJFD85YDrg3aUzl+fwoHr+B4feGXpQFdclhcdQJAl1eIWI
   0wPp+Npf7czSF/EUa+NtqaQG5njADlPnczs24JIxH8EjxUg1fFq4SWScw
   oGLnK/oNokMrf5bdhSPQflbC3nNubrLVSxSDF4vVaa4HNOq44pSO6l73R
   Vil+AxGdZFYbo1ubGN3MsEV1ePpbBEcYDhPE8etNaTXO3FvOFJjeawkYH
   aCw5jmaA2+zsXckVqW1iQbizInpwv1R4x6tF83XBBGnGkQSb6dJTkyioE
   LXZOCRHgz3hJ964OJoyowE5jSo5Qb530OXcy9FR3WnO6K2NzpOyW8+1Nv
   Q==;
X-IPAS-Result: =?us-ascii?q?A2AUBQBFYXhk/xVEqgpagQkJgnKBA3MCt1IPAQEBAQEBA?=
 =?us-ascii?q?QEBBwEBRAQBAYUGAoVgJjgTAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGB?=
 =?us-ascii?q?AGBHIUvOgyCNyKDX14BDAlrJgEEG4J3ghVHrxkBAQF2gTSBAYIUBJ1IgWiBQ?=
 =?us-ascii?q?ok4g2AVhDOCT4FYhHmCc4QSgi4Eji2NcYEvcIEhgSaBAgIJAhFngQ4IYoFzQ?=
 =?us-ascii?q?AINVQsLY4EjglkCAhE+FUp8DgERAwcEAoEHEC8HBDIoBgkYMScGVgctJAkTF?=
 =?us-ascii?q?UIEg2cDCoEbTBUSAhFHBzYDRB1AAwsbITQ9NRQfBQSCRwRxgRFMnGGGQ5M7n?=
 =?us-ascii?q?RaUUAeEC4Fdn1gXg3+MaphnmA4gp2oCBAIEBQIOCIF6UIEuMxojgzhRojWBM?=
 =?us-ascii?q?AIHCwEBAwmLRgEB?=
IronPort-PHdr: A9a23:6fapiB8YgUxERv9uWbi8ngc9DxPPW53KNwIYoqAql6hJOvz6uci4Y
 QqEtKwm1QSBdL6YwswHotKei7rnV20E7MTJm1E5W7sIaSU4j94LlRcrGs+PBB6zBvfraysnA
 JYKDwc9rDm0PkdPBcnxeUDZrGGs4j4OABX/Mhd+KvjoFoLIgMm7yeC/94fdbghMmTaxbq5+I
 RurpgjNq8cahpdvJak2xhbVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3U
 bJXAjImM3so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RTKv5
 LptRRT1iikIKiQ5/XnXhMJukaxbvByvqR9jzIHbe4yaLuZycr/HcN8GWWZNQMBcXDFBDIOma
 IsPCvIMM/tCoIn7ulQBswWxBRGxD+3q1z9Ig2X53bcn2OkmCgHJxgogEM8Qv3vKtNX5Lr8SU
 eOozKnN1zrDdehb2Svh54jTaBwuvfaMXbdpfMfX1EIgGB/LgE+Kpoz5IzOayP4Ns26D4udvU
 e+iiWAqpgJ+rzWv28oglIjEi58Vx1zZ9Ch13Yg7KNOmREN4btCpEJhdui+VOoZyXs4vQGNlt
 iY5x7AYpZK2ejUBxpc/xxPHdvCLb5KE7g/hWeqNOzt1hXFodKihixqv6USs1OzxWtW63VtPs
 yZJjt3Bu3EI2hPJ9sSLV/5w8lq91TuK0g3e6OdJKl0um6XBMZ4u2Lswm4IWsUTEAyD5hl37j
 LSTdkU44uio7PnnYqn+qp+cKYB0jgb+P7wtlMKnH+k2MBAAUWad9+qm07Pt41H0TKtSgv03l
 KnWrozaKNwGqqKlGQNZz4Qu5wqlAzqn09kUh2cLIE9ddBKClYfpOlXOIP7iDfe4hlShiCxry
 OrAPrL8HJrCMGDDnK35fbZ+9k5czRA8zcpE6pJIFr4BO+j/VVP2tNzdFhM5NRe7zP79CNphz
 oMeRX6PAqiBPa/PqVOI/P4gI/GQZI8JvzbwM/8l5+bwgn8/glAdeLWm0IATaHC5BfRmP16Zb
 WDrgtYAFWcFpBExTPfwhF2FSz5TaCX6Y6VprDYjBYSsCIzrQoG2nKfH2zW/F5dNIGdcBRrER
 XDweoOOXvwkbCOJPtQnlS4AXLK6DYg72kf9mhX9zu9cJ+zY9yAA/bH+0dFvr7nInBc++DFsS
 dyezmSEVUlolXhOTDgzivMs6Xdhw0uOhPAry8dTEsZesqshuk8SOZ3dyrl8DNb/EkLEc8ySQ
 VmrCtOhHXkqT903ztNPBiQ1G9irgh3ZmSb/BbgTmu+HAZUu+ffa2H78b89213fB0vwniF8rC
 stCPGGrnOhx7Q/WUpLCiAOSkKP5HZk=
IronPort-Data: A9a23:gsiunqK67mhw84nMFE+RQ5clxSXFcZb7ZxGr2PjKsXjdYENS3jEBy
 GIfCG3UbvaIZ2qmfNt3YI2xphhUsZODmINnGwRsrCA3Q34R85SdCYqVdE6tYH2YJJSdFB89t
 J8XZ4mbfOk5HyTWzvuP3hgNjpXeOYWgHOeU5DvsY3gpLeNcYH59z0olwYbVu6Yw6TSDK1rlV
 eja/YuHYDdJ5xYuajhPs/zb8Us11BjPkGpwUmIWNKgjUGD2yiF94KI3fcld+FOlKmX8NrfSq
 9frlNlVzEuAl/seIo/NfoLAT6E/auW60T5iKJZhc/PKbhBq/kTe20ugXRYWQR8/Zz6hx7idx
 DjR3HC9YV9BA0HCpAgSexYIEHlzAKcdxJbWBiWZms+Y9m3kTmS5lp2CDGluVWEZ0sdRKkFo2
 dggDQwkNHhvhcrvmPTiFbEq2JRldpCD0IA34xmMyRnCBPAqTJ3bBb3J+NpRxh8sjdsIFvHbD
 yYcQWs3NESZO0wSYj/7Drp5jcyBlif0cQd2g327gaVnuzKClTFYhe2F3N39P4biqd9utkGAq
 2TM+m/RBhABKMfZziiB+3i3wOjVkkvGtJk6TeX+r6EyxgPDgDZKYPELaWaGTTCCohbWc7pix
 4Y8oHJ/xUTu3CRHluXAYiA=
IronPort-HdrOrdr: A9a23:hex9lqBdi12NQH3lHel155DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 xdm6oVMqyLMbB45/yKnTVRC7wbsb26GDjDv5an859qJzsaDJ2Jv29Ce2Cm+lQdfng+OaYE
X-Talos-CUID: 9a23:I6pwWGG8t0LXK7AZqmJopE1MF/0vKUH03VCNBWS7Al9JaoCKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AIo0bZgxkYGbj60u0OUyUcd6XUGGaqOO/I2kdz54?=
 =?us-ascii?q?EgeevGgJUNGfF1mXuf6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,209,1681151400"; 
   d="scan'208,217";a="900810950"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgClN74awP9IcZVdL2lnRMSc3hC60F0KXtJgAU+9Eij0282t97JSB8lWMrCT93aEQmC9tYg4IG5Ant5Y9k8zXJAr865jWmgw3fSMWEVTqgPYiRGeAfhLZBRG+rw6D6F9N3kZX2L3n1/RrdS4p2o4qKCKw5SVcxWN+kxIY6JmfJR2PIZSdtkUHk5wd5LkpOdeVtDhjfpltNWaO+cIaZ8Gn2VziBeIcs/Ts/Xgkr7TF3NlhLb4t3KFB0Nhs47au5tl7HyLAy9xFyk/qMPlQawjeCW737kSTga9oWhGpBdEpyQy0QacLxidHuiblj9GWpmToqf3pD7LY44kpNj718HbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8req2AWXwfyOqsiDgg2iqWrH9uthF+Ofli3+D0fgk2w=;
 b=b3Vbh183CkyOlBn1NaR2ROU3e0i3VmxFExx/2mfWexZ1/758fjK1VksR5WvEZVcELiZkm6uHEbB6AyBPi/cWDB1ksBQlA3Yw86R7CmPHg825yC5uJHynUVOsQUHhrT7TLfs36Pw3DO+92HRSyGp5ObuMfjDOlo145rfLdaWs4nzdfgavYg//rAAa9NbBnL8n5IgxPIAewlewPLkFKS+RypbhCmA+6hhpqf/FhG6kQtb6Cw8moK5oX8bOsi7lAcP1gWt4DRM834ZcA3BmgznCU5G/BtfdBh9Y0T43nkxowR6hyPGoJJU2XNYM/8yz/3hlly1WjuouEuvUxo+Ev9ZHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Building u-boot separately 
Thread-Topic: Building u-boot separately 
Thread-Index: AdmUaWp9426ob9UjQ9qyZEw6hnE12A==
Date: Thu, 1 Jun 2023 09:15:54 +0000
Message-ID: <MA1PR01MB41291E1E9F2CF4964CBB9E8287499@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=efd9f062-3ba9-4dfc-9074-fda41e6113fc;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-06-01T09:13:37Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PN3PR01MB6627:EE_
x-ms-office365-filtering-correlation-id: 3af9fe79-b592-4f1a-448e-08db6280cda2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PKsbTKk1fCTyaa5SaEvwjajRK5KvjW7KjJAR7hWRORcQDRjGZ8govUmaK/xZOth8sciHU+E5xzfKDYUdgaaZz5qBdTMHCEqcdVx+q+4ZnqOI7BPlBDdKRRusstUJRNieKw17S1X6rxyYhxzeddkQJsU017a60NK17BIL/Z7pUa5EnZPTeAM3RIR7eyZ102clWb747s5U3kj3suFQEBB8aNKIAAAmmNxYH4+YrNiL9i27dH6W6mD64r/Y0iKY7VKecrtC6I90h5gTIxCHsamJ7Mh6CDF0kCcJT7WV6OW0DNNWjzpTIWd8VbtPfn2FhtKHsCZSq85bnokCw26QN39ZBPIm/W3mKlCZ8Z/ACROemw4I6QXKGbdSQaUoS/YONV6GgGTcjxRB5lVavBpf2WPt22lp7P9lCgNi9DnErf9A/fS/Zr8ADHYbvSwT9+eAZ0yPLSmQhtn+YAnOOVFuBxZROrh3DNGSPk5cmw5aGhythH5WwqmzuxMXt8PKxF8umrQYLlxz9ik6Qj8CRer4JFfZxFqXlKBk0KNNVb+9ua6IjMXlX1KuqjXpEJwTmSL1B3IyN6vzUNQdiZu7WAp5g6mLJKEeR8h3kPrp/NJbo/bFaB35ZpKxmo24Ouow+8LDZZ5p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(38100700002)(3480700007)(26005)(558084003)(33656002)(9686003)(122000001)(82960400001)(2906002)(6506007)(55016003)(186003)(4743002)(71200400001)(316002)(66556008)(66446008)(66946007)(66476007)(6916009)(76116006)(478600001)(64756008)(52536014)(38070700005)(41300700001)(86362001)(7696005)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6Jw5NYgt3/5cVpDO+G/CP5ej0mKwOhqj0WBAOXfXr423I6w3yA5eDW0tqzrE?=
 =?us-ascii?Q?SijNDm14BSRVdum5uUb97kpyJvwyuzlWajcwPb9v7PGSAo0eEkBD9W6VeprE?=
 =?us-ascii?Q?GahgKyN87jDqrL92/jOy3Jsf5WPqQROFc9d0gxGh0cieLUVUSTvhepyVVWBc?=
 =?us-ascii?Q?phYeB+7bDQXo5B0p6SOPvEMNPoBDtftHLJ17WRmTADhsJ6/O8lYAGdsshGgL?=
 =?us-ascii?Q?mQ7JZIKOUWd/V4KWV6FwnFg/pUHdLx4hSyztvCJzGbvSZzMIoubXXZCxkpWk?=
 =?us-ascii?Q?GJ2DnuWycEV+n4fZxKN7EAfMO3/89ObYm9SqGpzNJkNlLeP7o7ixrQRP7dmd?=
 =?us-ascii?Q?+McPOfHV0a7uxv4sQyYEUF21BGVXI6x/oPoJfBSsDqA4DZY4tWXSX+vaNybd?=
 =?us-ascii?Q?nFjuhXTvcEEnTjtJN7K7CR1bpZbZcmd6IF/xm4AzCI0XJmBkCL87/BY1aPL1?=
 =?us-ascii?Q?0I6pjTrHWZu/FKRfE035Y/zlgxxBDq39ntsjQXEjqA4XQwQ3uvviAbSpm6XD?=
 =?us-ascii?Q?KL2utoCaiXqoF90G3/k7PUcQCCgwWWSHiUce61l1lWt1VoJDqs3D0DOtjO0g?=
 =?us-ascii?Q?8xwf9yMmHdNl90lB3G8V3O9DImUz0hdhZP6hSjVBojofdlTwMswgLuTJSuFN?=
 =?us-ascii?Q?Nz0ColygH5/E+x9FDoK25Je2OZJjgVYuOSabE2gH6+Q0sVKTUyjLaLDwlXnf?=
 =?us-ascii?Q?HXuvvX68zHAE1PIyt2dZxZCGbozxZZF9W1iYDFvRVg5AVi0T2AE5GL9HIPQW?=
 =?us-ascii?Q?sfqZKZlY3YoTq6v7ztWbxRlfYsueZikVkY3ViQZhJErcvNnUjudl7r6mYzNB?=
 =?us-ascii?Q?IOKNLiuVhbNQNjoiRDjAsr5KRBfoxI3HaEc76xKuILhokRjoP5jqmq7JTLSX?=
 =?us-ascii?Q?zebkUtsac3qfj9Xde42i+K58+mVzYGucpBT3hPn2fP+naz1gPsayyLTburNX?=
 =?us-ascii?Q?7PpagrrpR8YDsWPBCoDv1P68e5r6+mY2toPAARS6rL5Ai1ALPNtGrUTtHOrh?=
 =?us-ascii?Q?UW/YIEBfpsOSB+NsYTpgQgvDrNHen04G6GHB+M6/xCOpNvpAm5DNRckDESvj?=
 =?us-ascii?Q?3DHUZO9gJLuAmuTC1px/jV5ry3H+yWuZ7AblycPf6VnepMnJtrcJ9rxuMray?=
 =?us-ascii?Q?/en26ST4hhxBIUvSnzcs8v+iA1VpfPGXEPZSBzbZsgO1HnzfuDArzgOuo0HK?=
 =?us-ascii?Q?zqENbfmf/bVqXcAFUKHMFUZAiOrRmFku0vmsT1j2xzf/5+QF7SyoTG2SrsK/?=
 =?us-ascii?Q?oHyUWsFcJY05TrZ80uTSBXdyJkSRhU1uChwbsEhgXj8EVBUHeO/DwvEiTwpD?=
 =?us-ascii?Q?2sitAm/Vw9kmkneKbEmpyA37PvFTwbLbTeOk5brxmX+JCYGtzCTtwTn/KusF?=
 =?us-ascii?Q?vD0yEmQE8RqaoX7bJYSvJJvokVatjDtSTJXZCNJOvMILNJ0umiuEc5CRsjlF?=
 =?us-ascii?Q?htOWJ95a3m8vkyvEdcClIU9sgLJJ4jijV1uC1bTJsJV0WntZ3bbC6faFkb7E?=
 =?us-ascii?Q?Mdpcs2mNAFQzt58mPUm/lREDKQzEmoWINWheNpowWFbrqUvi6hIF45YsCPKM?=
 =?us-ascii?Q?LlBnaUaMGURw9ScJM9E=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB41291E1E9F2CF4964CBB9E8287499MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2uzshW4F//yg7hxRCEtKfg3p8Q/g29yEkphoDnm/4s5WzqzyHKI7Qe+JNAzfkl+59HEbmnFBbAjW47sWzZ03biG6/gGwwHI9PuuttRsQhV9L3TqKfIwlihwbuT3at+NtC1tEvQFKGD3C5J/rjD94n5oP26BG0kwDJUqak4oYOzgjlfUnSvJxap+PBhbuQPdJsnOqEYK+42LPx2PTWmoxySDKRfMVU5bVTkFCeFHcUt5xubCaKfZSgRBxEyPHGJg0Iu1bvsjRtIdePYv3uHMQejfwIJDsGNx87Iqn9fwwsH2n7wTzVlAFqdrHUe+y5U2IbOsMJ4j0+HLZygVEAKhq64y6WHL/ozvsz3WsPpjzSeth9ip3dlSTeI3YP8RGqVoy3Yp+JHwxni0ELL5AAKrYVPW3m4PhrmPNX/Z48B9n1QgZonkOf4ZmZhnY81Cw0YkbYyjHtlX5IUqdskmitt9L5z+kZ3cRXba6TF4rITHavYHEtW/TUTktuYoD8rurJQk6fdGTEBt2dwJXBD9vGRrVy/Ms0wf3SB/083fkUNTg1PZTty6lcPl4MfbCPk71qkf6hUPE32+QmKjGDoriqsbv0gznC/FzPa6beIHyBbkWBYrYu7eU1smrj2oQ0Vloga1aIhxK1TPbk6WMupQvQY5YCrd4mIbjIHAFJhYsM/g6iY4cJH3LB6r2KEoPsZ5wZe6ByOwZFvVqnu8sJTlawQQrAD4VNlnxxJU5d0VzarAqbeCmrq5Ao+1y5ZI2zLrPZyVA4zcWJFLekYJrBFhUgg5Nr7IbSoRxX0MjMLXohhBFON4=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af9fe79-b592-4f1a-448e-08db6280cda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 09:15:54.8115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2GT2UiLSq+mGQAwp0ND3fU2Q+6BwHuZlzBf+11Ocb7LOWqNRNKkB1FZK4QnhcZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6627
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27664.006
X-TM-AS-Result: No-10--9.953800-8.000000
X-TMASE-MatchedRID: ejzu4ybJ/gRvac7yhEA/7qekGZXOwUBuOhJ9m53n4aAwaoe6trQC0chy
	Pab4fvVvgMBtpml0DCBJpV9rHFX3j7MwnTKgkbsOwbRQ2Bpmlioay+BQxgCfhdfVxEPp7g/ksUh
	+OkaOhpfCfvo3UgFFJJpJ/iGeRMFQP7A6mmzUskCA3KVVsj8QDMaGUx2flwhRGHWakJc1ULxOBQ
	o6IPXuUtl9DHcHloy4U9IBYcMFyd1akh0Sg+q4f+JOzIOycbNPNkknTRICN7CDnvFZItnypG1bB
	BSan3/JqV/q9KFgVMi4PO5g/3Hnh99faxl/I4mhngIgpj8eDcDInWAWA4yE6Ymh4HoGKNEhKrau
	Xd3MZDXwMUUgHNDhDVVVitZOtgxyNGNF6h9AZZCWSITzOnYqAt5CA4Ltg7GVudQjCG4H7O9oxBj
	ReBZQd+88XcGBlMkYfPeAE+Y8pAIPt/LyJXR6tlNZplOs2juMftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.953800-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27664.006
X-TM-SNTS-SMTP: FA0F8E1AF0E1B00849191D74570EE180FE6A60EBC1F58E643B6292E5BBC7D0522000:8
X-OriginatorOrg: TCS.COM
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

--_000_MA1PR01MB41291E1E9F2CF4964CBB9E8287499MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi,

We are trying to build the u-boot(the one in openbmc) component separately.=
 Could you please provide the steps to build it separately ?

Thanks,
Sandeep.


TCS Confidential
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_MA1PR01MB41291E1E9F2CF4964CBB9E8287499MA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Left">
TCS Confidential<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are trying to build the u-boot(the one in openbmc=
) component separately. Could you please provide the steps to build it sepa=
rately ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Left">
TCS Confidential<br>
</p>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_MA1PR01MB41291E1E9F2CF4964CBB9E8287499MA1PR01MB4129INDP_--

