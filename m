Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F93FC398
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 10:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzKdJ4tdyz2yK7
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 18:11:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=rvjXWDEw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=shuox.zhang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=rvjXWDEw; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzKcq20cnz2xXP
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 18:10:33 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="205644628"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
 d="scan'208,217";a="205644628"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 01:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; 
 d="scan'208,217";a="427406173"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2021 01:09:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 Aug 2021 01:09:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 31 Aug 2021 01:09:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 01:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZP/ltdxVyvZSQvuX6S8BbSqXi9ppGbYXBC8JtKNJTvv+QrxoVjJ/MkYqErMkfTxKJPhpUyogPf7TBoh+5EXQSgwCrp4vgzuQieLivxpccurJAD8Fp01JoHup8q2zJce+i4Azxv+r1EGOXXJq7PLJSz9KRHRoiwkWOPMNHEmUW1ILWJLldZXtTVDAx+omzsyUv+7gUEISTfAxm7D42BvmokWdXEQdRc3YJmlnKe0GyxdGS687glvMAz1Trtc7dc/PJ1pipZXrzcx+InifdgvjWdF3QhMw2zbw/Asp8naB6XvelOE8y4YweriTNJZrNsSJfelNvjMMnBI2MDJ4/uFujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUFE0ipXr6jNm/x4P13qDfqg3OiPnfpVlvdexpzY0Lk=;
 b=iXW2d//IL3cZgUsKMoaUSIzQ7mPNMcVGnNf4sQWs0Hikm3sR4x30T9hkNXC1I6yjTqqubKX0eBYTYfbXhVzwbqjZ80w6UmOjQQu/RT8r4SDR9NuAY//KKt22zrzTP0XhMnmotj/kqc6JqbWUH2+wPjIlbgOGtpirNhbLuyR53I5DZiyAl2gInLcQV7ySxpRFzPJWRWkoVqja/xtC7ZVpwzzPYkvx3QcpDMXC3VB+pEAqM6lYfwQA02thPIS9LDuqz7yJwfzHw2xZrWcpdDZoN0EWL37gIuuv80ny0zsghIhrl6l1XykverZbPh8u1EZ+jAiixJDrGSqU4Z2pWlwWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUFE0ipXr6jNm/x4P13qDfqg3OiPnfpVlvdexpzY0Lk=;
 b=rvjXWDEwAhSf6ZgnxUMDFHDoeZsycHQse6KITAkcyL+x7b6b2S4SkSGYkIBDkaub75NpZE7HLTqYTPb7mD7MCgBcgDAYsLXVYnMmKHEqiQeTDKkVWEi8VLb+NsAaqmsG4TXlhw6tbEXf91O2aaPNT0mAX0R7c8JZVG2IPqtQasU=
Received: from DM5PR11MB1547.namprd11.prod.outlook.com (2603:10b6:4:a::15) by
 DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Tue, 31 Aug 2021 08:09:27 +0000
Received: from DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63]) by DM5PR11MB1547.namprd11.prod.outlook.com
 ([fe80::9829:6c67:d7ca:af63%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 08:09:27 +0000
From: "Zhang, ShuoX" <shuox.zhang@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBmc Redfish support etag property  error
Thread-Topic: OpenBmc Redfish support etag property  error
Thread-Index: AdeePSFw5nsUxSvgTqGiuBdYyFg9gQ==
Date: Tue, 31 Aug 2021 08:09:26 +0000
Message-ID: <DM5PR11MB1547951F649CFEEEE6188058E2CC9@DM5PR11MB1547.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dc781f1-c56e-4727-d397-08d96c56a6c7
x-ms-traffictypediagnostic: DM6PR11MB2780:
x-microsoft-antispam-prvs: <DM6PR11MB278085004CA0BE137A1501E5E2CC9@DM6PR11MB2780.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tiExC8Dyvguor8JMylpuyOWbYD50wsencQ6bdYsvDlh4pGn7+Xg2AfcTtnTeQ3aAscVm5JDQKcOWJMw+Qx0cvmZvjwgBqr5Y72yFWHXDFmkpbc1g4hVrtYbwposg5nAY02UX9I+Vc/gW6pQW20kMQIcM5PJlfgGz6iu2ZMPuUOOv1xQCfmBkOYlHlVaPtuXQEPb6DP/Kh4goWqj3FNqrckJgcND3lueUWpp2gk1p1yhkfbDZm1KTQ89SAeIwBcDxP3wanP+jOU+ftTui0gWb/vJ+yjhnJ5wyn/rGvXqQrm/9sizdivqUMIzyvSG18+2tSmOiZWV609Sset4rjSNTp9nHAP/xe0BDDtZBkhcxdgEL7ZGnfX/mCkqzho1TaiQ57KW9uZK7LIPmeBkMniba3zjvu3pb1QoVXH5NRe1V3w+wmViHufjbOw/v33udSro8WsYSCDXTQVhclPdC5OBim3W9uQyC/yHLS8X0bv3NLFbLr68Mqtee9H3gYhz/BPcVe58dFx+tK05OPZP8897UMaMRvPbHNOYeUJt9f4f7zno792ryGnNge8CfNvlYE6/EfYJCvzxP7PxjkEL+vYA92wDWrY+HdySQ1qk/13xp2dniCYolOYVyw7zAXU3E9G+4nYpl5mFdziooMC3Y1N6awNd/9MiIcguaCNgPmyH4kJOVo3TVgMzoJgDvptAAVnUr11mqN6bvJUVQo/XmQgwdew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1547.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(33656002)(8676002)(316002)(83380400001)(478600001)(52536014)(122000001)(38100700002)(9686003)(55016002)(26005)(6916009)(71200400001)(186003)(66946007)(76116006)(66556008)(64756008)(66446008)(6506007)(86362001)(66476007)(38070700005)(8936002)(5660300002)(2906002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZVzJfy8uYm5fPAovwvOp18ecTFE8MWP/oygIG+XB1oB8rg0SwaW8nl9iH4n6?=
 =?us-ascii?Q?vvC+QoJAaegMBrTbI+7P5KGGRu/4+6nRr5y5kRtz+zBvkjrSamHJNDBST6Zj?=
 =?us-ascii?Q?5NmcMOC+JInIhQaZss98805NfQpvR+zkPkDn5TWpriLCfaJhxDz7gC+eba6w?=
 =?us-ascii?Q?If8owHb7HUU2fcCUUfixPjiUfP2pi8BlzgcE4881sqi56bXVATkICdmI9xG8?=
 =?us-ascii?Q?cY3W0MXAgBPzqKb1t59AwnfWaJYBPpu/Mm704GtzWp34opas0c10a91wArfF?=
 =?us-ascii?Q?85LPTJT9CGryjcF8l+9jNMKQBrl1/7Y0zVCqSqqfASxrKtIZE5FTUOZHS6zO?=
 =?us-ascii?Q?btFK+zEwYiCh3e19+6xsBBqo5ncrVG4BxQqnHKiCZLpoWcKwf+4cpGwdlJLW?=
 =?us-ascii?Q?mFciY4PQI9PAx47Thx2PZq6oH1d5Ap21UufpeSNJQTXuCcEThQcwvd86sdig?=
 =?us-ascii?Q?CWWxcSdOUTmu52wm4iNn20wUO1sh+NLPz2n/efoxG2UNf7THKCrYDWEnUGvd?=
 =?us-ascii?Q?bg9TkMlEnBpaRI8gfmr7qMvammE9xI7VnTu9u4c6iSIwUopUEUgcWw2WEVhy?=
 =?us-ascii?Q?c1zv9+J5r9xKMVCiqp99HvksyaiVCnZZVS0vwqiTYJBztsJldNxo1GXn5cuz?=
 =?us-ascii?Q?Tsz0klLChtrUFAYh5wB6yNhV1hsaWr47bNAe0nCpRP7l0wuFd5fVdReZPF4N?=
 =?us-ascii?Q?JfAdMwlyfh/koPpSIWbEdU9xuj9TiCr3y1UFwC/9WLuDIIiU9Ot5yGbPaHvq?=
 =?us-ascii?Q?PJ21cGpCMhp/JvUcD4VxwwO/ZaiNfKZaGUnmDfMuVtnrAylOb9SXUHU84f3K?=
 =?us-ascii?Q?GfC+dGFcn5Zu/M12CWVww5fZgOVLZsCi2CXH098xVWf36x5pqZFjCnW/N+IS?=
 =?us-ascii?Q?VDhiuZhyFOXtW3ShjF+lBKmN8batEt/xFVLuxygEz1UY/RNYBphVQU4a1lgn?=
 =?us-ascii?Q?s17xUfO9uFTrKaTRu1dHeUNUILPAxA0BTV2nR5yj8k+eNyEy2uFvhPuDcNsO?=
 =?us-ascii?Q?QBvA6Dp8R/QUlnFh8sLQIUfSJzKBOpNzsp3AkshLEa9rSZtjzrZFKsIrg/gs?=
 =?us-ascii?Q?gCYojkIgMEkP+XFifH/rDk6VfeHju8E9qtUSwor2PHzOjhqe2ZLYkOiU3kIc?=
 =?us-ascii?Q?u3L3P9ewQ9uTEceYpRHda1c5O3Gmdxake/eG/EYzO+ZB5htlo9hqbXIpE7wZ?=
 =?us-ascii?Q?0M9ss6Q91iz2RGVFWerppgNCeImBVoy67mMpPIg5rNwSHmBgUqLg7I3xZjm0?=
 =?us-ascii?Q?RpUcNp4jP6JgxTyMCQJzsLDQKunE17DLHhV2tnAstdxXIQbHKTfendcn6Ucc?=
 =?us-ascii?Q?NeLNmNK1S2lUrpfXlqQVNGSU?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM5PR11MB1547951F649CFEEEE6188058E2CC9DM5PR11MB1547namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1547.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc781f1-c56e-4727-d397-08d96c56a6c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 08:09:26.8947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPIWivskvXpkvLbfb0MBAGLral2c/QwaW1lQBmpXfKiB2DvyJ5nqAve2a5IezVKvaiHO97pgwSwpki/AfkMhFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2780
X-OriginatorOrg: intel.com
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

--_000_DM5PR11MB1547951F649CFEEEE6188058E2CC9DM5PR11MB1547namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

hi,
              Etag is to check whether the json string returned by the serv=
er has changed ,  I plan to use MD5 encryption to generate etag , can't  fi=
nd etag in http request header.

              Here are the steps I tested:
              1,  I used postman to send the first request to a URL, and  a=
dded the etag property to the header of the response use hard code , then h=
ttp connection function async_write respond  header  buffer
              2,  Request the same url, read the header of the request, no =
etag can be found.

              Here are some logs:

Respond:
Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "http_=
connection.hpp":683] 0x1a3e4c8 doWrite
Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug res result : 200
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Strict-Transport-Security =
, /text: Strict-Transport-Security ,Value: max-age=3D315
36000; includeSubdomains; preload
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : X-Frame-Options , /text: X=
-Frame-Options ,Value: DENY
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Pragma , /text: Pragma ,Va=
lue: no-cache
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Cache-Control , /text: Cac=
he-Control ,Value: no-Store,no-Cache
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text: X=
-XSS-Protection ,Value: 1; mode=3Dblock
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text: X=
-Content-Type-Options ,Value: nosniff
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : <unknown-field> , /text: C=
ontent-Security-Policy ,Value: default-src 'none'; img
-src 'self' data:; font-src 'self'; style-src 'self'; script-src 'self'; co=
nnect-src 'self' wss:
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Content-Type , /text: Cont=
ent-Type ,Value: application/json
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : ETag , /text: ETag ,Value:=
 ba2e34ec8c7d9168cc2bf880a1674ae4
Jan 11 23:45:25 intel-obmc bmcweb[361]:  field : Content-Length , /text: Co=
ntent-Length ,Value: 525
Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug response: {
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "@odata.id": "/redfish/v1/Certifi=
cateService/CertificateLocations",
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "@odata.type": "#CertificateLocat=
ions.v1_0_0.CertificateLocations",
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Description": "Defines a resourc=
e that an administrator can use in order to locate all
certificates installed on a given service",
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Id": "CertificateLocations",
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Links": {
Jan 11 23:45:25 intel-obmc bmcweb[361]:     "Certificates": [
Jan 11 23:45:25 intel-obmc bmcweb[361]:       {
Jan 11 23:45:25 intel-obmc bmcweb[361]:         "@odata.id": "/redfish/v1/M=
anagers/bmc/NetworkProtocol/HTTPS/Certificates/1"
Jan 11 23:45:25 intel-obmc bmcweb[361]:       }
Jan 11 23:45:25 intel-obmc bmcweb[361]:     ],
Jan 11 23:45:25 intel-obmc bmcweb[361]:     Certificates@odata.count<mailto=
:Certificates@odata.count>: 1
Jan 11 23:45:25 intel-obmc bmcweb[361]:   },
Jan 11 23:45:25 intel-obmc bmcweb[361]:   "Name": "Certificate Locations"
Jan 11 23:45:25 intel-obmc bmcweb[361]: }
Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "http_=
connection.hpp":698] 0x1a3e4c8 async_write 997 bytes

Second Request:
Jan 11 23:45:25 intel-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG "http_=
connection.hpp":511] 0x1a3e4c8 doReadHeaders
Jan 11 23:45:25 intel-obmc bmcweb[361]: zs_debug read http_head :GET /redfi=
sh/v1/CertificateService/CertificateLocations HTTP/1.1
Jan 11 23:45:25 intel-obmc bmcweb[361]: Authorization: Basic cm9vdDowcGVuQm=
1j
Jan 11 23:45:25 intel-obmc bmcweb[361]: User-Agent: PostmanRuntime/7.28.4
Jan 11 23:45:25 intel-obmc bmcweb[361]: Accept: */*
Jan 11 23:45:25 intel-obmc bmcweb[361]: Cache-Control: no-cache
Jan 11 23:45:25 intel-obmc bmcweb[361]: Postman-Token: 1981d43c-7067-4959-a=
853-dd7f93bb04fa
Jan 11 23:45:25 intel-obmc bmcweb[361]: Host: 10.239.138.19
Jan 11 23:45:25 intel-obmc bmcweb[361]: Accept-Encoding: gzip, deflate, br
Jan 11 23:45:25 intel-obmc bmcweb[361]: Connection: keep-alive
Jan 11 23:45:25 intel-obmc bmcweb[361]:

--_000_DM5PR11MB1547951F649CFEEEE6188058E2CC9DM5PR11MB1547namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">hi, <o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Etag is to chec=
k whether the json string returned by the server has changed , &nbsp;I plan=
 to use MD5 encryption to generate etag , can&#8217;t &nbsp;find etag in ht=
tp request header.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Here are the st=
eps I tested:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1, &nbsp;I used=
 postman to send the first request to a URL, and &nbsp;added the etag prope=
rty to the header of the response use hard code , then http connection func=
tion async_write respond &nbsp;header&nbsp; buffer
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,&nbsp; Reques=
t the same url, read the header of the request, no etag can be found.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Here are some l=
ogs:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Respond:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG &quot;http_connection.hpp=
&quot;:683] 0x1a3e4c8 doWrite<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: zs_debug res result : 200<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : Strict-Transport-Security , /text: Stric=
t-Transport-Security ,Value: max-age=3D315<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">36000; includeSubdo=
mains; preload<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : X-Frame-Options , /text: X-Frame-Options=
 ,Value: DENY<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : Pragma , /text: Pragma ,Value: no-cache<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : Cache-Control , /text: Cache-Control ,Va=
lue: no-Store,no-Cache<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : &lt;unknown-field&gt; , /text: X-XSS-Pro=
tection ,Value: 1; mode=3Dblock<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : &lt;unknown-field&gt; , /text: X-Content=
-Type-Options ,Value: nosniff<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : &lt;unknown-field&gt; , /text: Content-S=
ecurity-Policy ,Value: default-src 'none'; img<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">-src 'self' data:; =
font-src 'self'; style-src 'self'; script-src 'self'; connect-src 'self' ws=
s:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : Content-Type , /text: Content-Type ,Valu=
e: application/json<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : ETag , /text: ETag ,Value: ba2e34ec8c7d9=
168cc2bf880a1674ae4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp; field : Content-Length , /text: Content-Length ,=
Value: 525<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: zs_debug response: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;@odata.id&quot;: &quot;/redfish/v1/C=
ertificateService/CertificateLocations&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;@odata.type&quot;: &quot;#Certificat=
eLocations.v1_0_0.CertificateLocations&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;Description&quot;: &quot;Defines a r=
esource that an administrator can use in order to locate all<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">certificates instal=
led on a given service&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;Id&quot;: &quot;CertificateLocations=
&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;Links&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp; &quot;Certificates&quot;: [<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
@odata.id&quot;: &quot;/redfish/v1/Managers/bmc/NetworkProtocol/HTTPS/Certi=
ficates/1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp; ],<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:Certificates@odata.count">Certificates@odata.count</a>: 1=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:&nbsp;&nbsp; &quot;Name&quot;: &quot;Certificate Locati=
ons&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG &quot;http_connection.hpp=
&quot;:698] 0x1a3e4c8 async_write 997 bytes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Second Request: <o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: (2021-01-11 23:45:25) [DEBUG &quot;http_connection.hpp=
&quot;:511] 0x1a3e4c8 doReadHeaders<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: zs_debug read http_head :GET /redfish/v1/CertificateSe=
rvice/CertificateLocations HTTP/1.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Authorization: Basic cm9vdDowcGVuQm1j<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: User-Agent: PostmanRuntime/7.28.4<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Accept: */*<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Cache-Control: no-cache<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Postman-Token: 1981d43c-7067-4959-a853-dd7f93bb04fa<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Host: 10.239.138.19<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Accept-Encoding: gzip, deflate, br<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]: Connection: keep-alive<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jan 11 23:45:25 int=
el-obmc bmcweb[361]:<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DM5PR11MB1547951F649CFEEEE6188058E2CC9DM5PR11MB1547namp_--
