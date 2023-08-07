Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78A8776F79
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 07:20:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=eviden.com header.i=@eviden.com header.a=rsa-sha256 header.s=mail header.b=HEkYdasp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLwHM3tzWz3cRd
	for <lists+openbmc@lfdr.de>; Thu, 10 Aug 2023 15:20:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=eviden.com header.i=@eviden.com header.a=rsa-sha256 header.s=mail header.b=HEkYdasp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=eviden.com (client-ip=193.56.114.176; helo=smarthost1.atos.net; envelope-from=francine.sauvage@eviden.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 305 seconds by postgrey-1.37 at boromir; Tue, 08 Aug 2023 02:28:17 AEST
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKMFF0RxRz2xm3
	for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2023 02:28:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1691425697; x=1722961697;
  h=from:to:subject:date:message-id:mime-version;
  bh=2oT51OnYKi2njiqSqU1yVWdLkM4HCO3a/VcEr73CSKs=;
  b=HEkYdaspmeYtb/ToHuyblT6USWI1p0dQbw6FXnNnPPfD0gdoCMcNr3qV
   qb6/9JtUdRFWKPEcRxk64ZEqjIK7LaOeKQVajr5ikcP9ZegzjBTtgneJf
   XQ/cCAaP2BqfK9vz+PPb5DGHh2R5CUNt5M96keZvqBcjCwKbfOWLVi5A+
   px+54W8+RzTXtMeGSnwn5te5o8OSYGNJ2G4OM/dmYZ8bnPouZMjpeT7rG
   UKequ1K+rh2dV/iCx303+i3Q5RawOUwVlgSH7k9QKfQhXG0h4Ma+oi78U
   vAha4Jc2LOM0Af4QpAXy8cPo8CqiSGPc3ERcRPeSeKQ91ai7/7AtI3UsH
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,262,1684792800"; 
   d="png'150?scan'150,208,217,150";a="413376460"
X-MGA-submission: =?us-ascii?q?MDFU6FXEbkNYG44VryVBGJlVgYQ77XCUE0p3/y?=
 =?us-ascii?q?CSxX/XE3nFBirzsBxvLNeTdfXnVVupqOMmESQd6HZzck2KSVJQ2LChBq?=
 =?us-ascii?q?uKkGQnPz+RWIjNpFTcv0iN5Q5tSQirALU14jOUMXfIldFp7kgVH3oVuI?=
 =?us-ascii?q?Gi?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB21.ww931.my-it-solutions.net) ([10.89.29.131])
  by smarthost1.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2023 18:23:02 +0200
Received: from GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) by
 GITEXCPRDMB21.ww931.my-it-solutions.net (10.89.29.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 7 Aug 2023 18:23:02 +0200
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 7 Aug 2023 18:23:02 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9lpiO6nfDChtj5chabrsRGoBHo6UPAA60RmAFZFb6fl+06BEBS+wvWT1pe6NG9T/guy8gIGadMfC4EU5F5sdyBQ0TXnOag0HI+qii4g0Wi/eg8ZS2Ig/pk1z7tA15lZQp8LanVjlRDcfKacZmay/TcZ0rnNr2bt1TS/BQU/MXX+XnVyjV5VWMcLFuc6dfhOViLoCtXe2z1wg4gYKHGKW+f2Y9bJ2zO9J8FtB0dFPT2GeFwOL3Q1ObWaVy7DWuFipmjPakB+HmleYKlp5Ujm8lrDb7fJ1Uf5eE358GJlhDxR4BCuhBUnZutKflmRkcXowVlH1jW5sWSMc1FsspVZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOdkhRf00gHYNWjehQbuJaOKRyEmPYAxMUdhY0N03Lc=;
 b=an3avl2ecVOlhikbfty/4E700TufN3wlCp8QrH6+6AjaF0f7l3CzF7Muqdu98wlfBT+ywHzFDjTnyF1BmXjpF4fsqD4xbtD1J3Pj3xfHDkCAm8nCdMplIaIjJ/JSPmAkEV59Ofn6FekaEaaXvinZezw7SHvzL7FnezakjC8u7yAcN1rehgnLrohMlrLWQN7Cv18jZZQ6EtykW3Fw//CBLGvCOIqUauplWNTrV8csKTT6+2Q8uSVVEi/KdU/2X/GyJeF+CHikmwZrRfZLE080aBGsHUVvJqKYadKQFvAc13LZuQHddryvw6fmf8UG5YHvJzwfRTyHeTKVO4X/ZmIj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by AS8PR02MB9981.eurprd02.prod.outlook.com (2603:10a6:20b:617::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 16:23:00 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::d17a:d9f2:3698:1084]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::d17a:d9f2:3698:1084%6]) with mapi id 15.20.6652.022; Mon, 7 Aug 2023
 16:23:00 +0000
From: Francine Sauvage <francine.sauvage@eviden.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Where are we supposed to put our CA Certificates ?
Thread-Topic: Where are we supposed to put our CA Certificates ?
Thread-Index: AdnJSul7fPGcsNVrQwanXqLhKzqQBw==
Date: Mon, 7 Aug 2023 16:23:00 +0000
Message-ID: <PAXPR02MB76802981CF9C4843ADACA274E60CA@PAXPR02MB7680.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=1f878ac1-75cb-4a71-93a6-773c0c4d471c;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All
 Employees_2;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2023-08-07T16:18:50Z;MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|AS8PR02MB9981:EE_
x-ms-office365-filtering-correlation-id: df7094f9-a1b8-4d6d-d540-08db97629150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 48wC0/WPWBZ4VMTkFTFWYUkD0hR4xJBVQ27RC7KY0o61SNbwx9Q7XCp4oPzJMXjq8Uxa2wT/n6joo4PlcJbDM/0N4kUjYmDfVyWne4TauZiorZNsKXPNmi3g0pKWRJ7mznk76k9F0SPe+H004PPdrMENDUFUESgwMoKg3swsiweqVyWzUq3GGfTvVNEEtlI0pRG8eyz18NPLyoN228jE5/1txbFxhK7OuWh1p0fn62O7q9hYu0EQbxT5b0sN7fc3jl18tFbWn8I+G/26J/bgpJ7jCqt3ZF+ATC0VTlm1BLXeeyyALQoVTHhzz2nc5yBvDHXWI0c7fXKrbAGbUHf4gmAnLwVYEkliJjY+Qw1HXjVx3I8Y3K2eURuGKrgopEYWwiiSzhPGqnQ3dGZ++svWMCDmSMtnOJeo3iCt4L8bZT4r5IzxHSXac6xbEnafWb+EAPKAQbQRLH0bHsbu+mrEtqoIIjHEd10QQXDPnT0N6CrW4rF6bWB+s/bwacodc7oyl15CsL4s2WJEEWzUBot2C8SVTec9cMEmZXNNMzdfI9t2zqG0SG15+krDGTrjOOZNWSFpMKyoL/E1B679mvyb9jck7WgFOSrOd974ypbxajkW4/jHlY/5rRLyYOMyttnhUvWLWpfqcsdg7+tD94eCfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(166002)(44832011)(41300700001)(19627405001)(52536014)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(7696005)(4744005)(66574015)(5660300002)(2906002)(83380400001)(71200400001)(38070700005)(55016003)(99936003)(316002)(66446008)(122000001)(66476007)(64756008)(66556008)(66946007)(76116006)(6916009)(9686003)(82960400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2icF7WXLD0x2bYLYE45pxJALs1YvY9x64eY5sCI0brG0LUjhkE0PhGYHRZ?=
 =?iso-8859-1?Q?+F+AAEm1wM+11fxuL8rwrlzcfTRFbih1DXeig98rzz7FKpECGQsvhrYfk8?=
 =?iso-8859-1?Q?nZ9ukdkGUImlUCGPGaJLlX4rGOBxAwn6/GqnalIGcAGZ0ty9tf4m9ZRzrG?=
 =?iso-8859-1?Q?OdbAbqdMaKT8zNKM04Hb6uTWJWDrBdfOSL4nsZoFQ/aEdUg5F+eIQYaxea?=
 =?iso-8859-1?Q?/6Dvn6ZYYjDzoE8XvoUEmDCUhNohtoIlBkH6i/vj6uhOJbMwjM0ASAJX5O?=
 =?iso-8859-1?Q?KKUU8U6OkN7oGw5pWUY5fhs+7/EUToc/G5KDNtIPi7nFq1wf6AleZbU+zH?=
 =?iso-8859-1?Q?iYze30PiA9FzVYl2l9GtZOE/HE6gJBbkT6tS+UMHsIIlU2E4nEopnVH5ME?=
 =?iso-8859-1?Q?DdI3yluXKiD0IGt6gVkUgMTQDSBj+KU3y5c9bJQ7lvGwK3c8dAXNyqVSif?=
 =?iso-8859-1?Q?eA2geg13wJD76MSSuUiRFa2ye/VvM65nVwtajp0kl0Xz+j5srWY8gmF+7U?=
 =?iso-8859-1?Q?5HcL6ga8Abtn8T4gEdRmmrX1V3Gw41bWuanZvT5MQiBwDc1UG6ww3Kmtwh?=
 =?iso-8859-1?Q?5+oHA3yRlHdnIaKl3b+XqJevltnfMF/3MFQQLwFRJUUx7/rHfF1XxOdPfl?=
 =?iso-8859-1?Q?8Ehe91Hbr0kcAjJRBTt5hA16tKLkxQWVha71wQ6DNCpVmRqTtXVEAdChM0?=
 =?iso-8859-1?Q?5IyjZoeaXsf5uiq22qPLRE3wcIu8humRfS5pWNwxiuJ+l8yZv1ReCBMdVe?=
 =?iso-8859-1?Q?jcR9I7dZSVNSoRMip47MEiLH7L7qhT2gtpU5cfZDqWdO9/j8HfwK1+v9dT?=
 =?iso-8859-1?Q?+1C3IqiKaL/h66QHp8e522RfVPa2Ypls/caI0c5ecXkvahmEE+NVSYjKjQ?=
 =?iso-8859-1?Q?ZOzL8CS55Rg9L01iVuTOvvnzx2H4Tt/tXbGN2tuk+pCeiRXfUf90799Pvy?=
 =?iso-8859-1?Q?JTSiEj4kCKKXJxzDMF6ksxs2Zc+dlaKURLLwE621gw95tFaFfK2tmFth/h?=
 =?iso-8859-1?Q?prNbNUxASoEFPE8e7Bs97dgZSDMEwonx/WnoushiK05TMf6OfUxHf7o+LC?=
 =?iso-8859-1?Q?4G0Jmx6C4GWsOvXfxU2gOGIXfv+vDzGBqHVDd5wb93iFApBpwPoiZXGZuH?=
 =?iso-8859-1?Q?NxFeDTxDAWM8dAkvX++bg2mBej6XwGndY9quygtFDdw6KtVDW13cixSAbb?=
 =?iso-8859-1?Q?5fG9XVqSdbBYrb57VHppjTbUElKb32YmSbcVJg6P+ZjtXsKp22fLfxxQJW?=
 =?iso-8859-1?Q?SzYNKL84OYEK/2HcU8FOAEhfa7K+DFvQjIOiJLLQXXa2eoh0Lu6dbLgHfG?=
 =?iso-8859-1?Q?cJyStUvr8HscLvc3dye635vNKozBym2utbFUHzV6EOC3YGlU7k8/dx7yfH?=
 =?iso-8859-1?Q?4/jvS+Z/Fp3jYZ8GZJ4LvQsJ0JlLQdfBuntFbK9ghHIJa1nAQrs/tLuBH5?=
 =?iso-8859-1?Q?OKct6oKIvoYJdrgmm7W+KSznH4Z3NXDKCAQ87aCIAvb79Mv+JMiJL7wn5i?=
 =?iso-8859-1?Q?olgUxI4kSabFwY5rm9XgkwpjNlfdDjxlMAt3kDXEFiOBd0nAPtJ8r2h5u8?=
 =?iso-8859-1?Q?flt0mS1v9uVdKGTNMR9zarNs33VAWSwNvWnWy/nECv29D7KruLntM7eQ5g?=
 =?iso-8859-1?Q?Pi04fBxLf8IKQLRxppaPzGuekLxMD4UzfYUa0St6EyXlFzCC72WQdCHA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/related;
	boundary="_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0fB+LaWyuepPGS0KImEI87BSrr/i+ifhQ15BnyCTW5sQeQYEM0X9rqIFEjV0kqWpEIUOQEU5Mk/HQ5pedLOtBObaTnPJqCyr6tpHaIgFWAc1MVxv+04l3gpSp4DZGbYQEDK/dn0671VIe+SAsMyYybRawQsHWIsz+ekzkrL+SU2FKJeLLRsEq/ovQYNOWNbS4JK+8ySc8iqqRU0yTUqPR03SsBqmeDNLmduoICEluawDosUcoqI8ESI4BZnq6n+JlIeFQFL1IbzO5b97I8HXvL/g1T0B4QK0nhiERIShFEYR6jSgYocNsoBHHBX33un0/afFaCmAjowkATfxnSs1jxVNf+4voMhnDGml6X/v3YfDcbAXidfe+we6kq/RR/fvHLn0ORg0kXR1y++0D7q9iwbRQaPWWIMQVDHQxb8P47IcbZGRCFlGNhXvuYgzgBnFqyhRcU3lqfSmTOJreGX7DvFvHd5fpBcFLklKA61Gis0aT5T/UFiVLe2LVjmf1JzE6tYyhAeUt6qJ0iDPXnSqqltHOKk7lzB/FRdxd/VFLYvqwyu+VNsr2OmCO9od8h7XXMs9ZBdFY6KdHPScMS3trgpDwm1HiUifsVFK4gSEd6Bwf7XQzrBASq4Hk1XVtsyCfqFymkFF84lR4453/kOye9QjiKjOhLQKCBiRVfe9qiSeEzVpFbFnTTPLscD5es7OTvgEmRe5wLSRhMWJKkXr2UBFmHL1yAs9duFyB6ZYtZHWhYAfw/lyLrXIaDWOU+Z+pn7OpqMcW2sUF36ofVsi1P6nrOzVa0uq3i1VevVDGPB96g5cubdvpyl7la0AWtqs/qEnzkIaMuo3kVFnpAzWJQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7094f9-a1b8-4d6d-d540-08db97629150
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 16:23:00.3623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8Gj3C0IFYJT9acW5RATn5IIZ+KEmcmIeqiiXAmy8SzvPzT5J0gHw5MAa1DdsWNhbIuQzXXAPDSsh+LX3xIHzBJiwEIswD1NLdTWTyaexZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9981
X-OriginatorOrg: eviden.com
X-Mailman-Approved-At: Thu, 10 Aug 2023 15:15:32 +1000
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

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: multipart/alternative;
	boundary="_000_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_"

--_000_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All ;

I cannot figure out where I should put my CA certificates (chain of 2 certs=
)?

According Linux system, ca-certificates.crt is built from /etc/ssl/certs (i=
n that case  : update-ca-certificates is OK)
According openbmc, I should put my CA certs in /etc/ssl/certs/authority (fo=
r phosphor-certificate-server : load automatically every .crt)
So system is not aware of my openbmc CA certs ...

So what am I supposed to do to be compatible for both mechanisms ?

Kind Regards,
Francine Sauvage
Team Leader - BDS-RD-PFM
M: +33 (1) 6 21 43 11 21
Av. Jean Jaur=E8s BP68 - 78340 LES CLAYES-SOUS-BOIS - France
eviden.com<https://eviden.com/>
[LinkedIn icon]<https://www.linkedin.com/in/francine-sauvage-consultant> [T=
witter icon] <https://twitter.com/EvidenLive>  [Instagram icon] <https://ww=
w.instagram.com/evidenlive>  [YouTube icon] <https://www.youtube.com/@Evide=
nLive>  [cid:image005.png@01D9C95C.310FBEF0] <https://github.com/frsauvage>
[Eviden logo]

an atos business




--_000_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:inherit;}
@font-face
	{font-family:Montserrat;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Montserrat SemiBold";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All&nbsp;;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I cannot figure out where I sho=
uld put my CA certificates (chain of 2 certs)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">According Linux system, ca-cert=
ificates.crt is built from /etc/ssl/certs (in that case&nbsp; : update-ca-c=
ertificates is OK)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">According openbmc, I should put=
 my CA certs in /etc/ssl/certs/authority (for phosphor-certificate-server :=
 load automatically every .crt)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So system is not aware of my op=
enbmc CA certs &#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So what am I supposed to do to =
be compatible for both mechanisms ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;border-collapse:collapse">
<tbody>
<tr>
<td colspan=3D"2" valign=3D"bottom" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:11.25pt;vertical-align:baseli=
ne"><b><span style=3D"font-size:7.5pt;font-family:Montserrat;color:#FF6D43"=
>Kind Regards,</span></b><span style=3D"font-size:9.0pt;font-family:Montser=
rat;color:black;mso-fareast-language:FR"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"100%" style=3D"width:100.0%;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Montserrat SemiBold&quot;;color:black;border:none windowtext 1=
.0pt;padding:0cm;mso-fareast-language:FR">Francine Sauvage</span><span lang=
=3D"EN-US" style=3D"mso-fareast-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">Team Leader&nbsp;&#8211; BDS-RD-PFM</span><span lang=3D"EN-US" style=3D=
"mso-fareast-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">M: +33 (1) 6 21 43 11 21</span><span lang=3D"EN-US" style=3D"mso-fareas=
t-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">Av.
</span><span style=3D"font-size:9.0pt;font-family:Montserrat;color:black;bo=
rder:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR">Jean Jaur=
=E8s BP68 &#8211; 78340 LES CLAYES-SOUS-BOIS&nbsp;&#8211; France</span><spa=
n style=3D"mso-fareast-language:FR"><br>
<a href=3D"https://eviden.com/" target=3D"_blank"><span style=3D"font-size:=
9.0pt;font-family:Montserrat;color:black;border:none windowtext 1.0pt;paddi=
ng:0cm">eviden.com</span></a><br>
</span><a href=3D"https://www.linkedin.com/in/francine-sauvage-consultant" =
target=3D"_blank" title=3D"LinkedIn"><span style=3D"color:#337AB7;border:no=
ne windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-decoration:non=
e"><img border=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;heig=
ht:.2083in" id=3D"Image_x0020_1" src=3D"cid:image001.png@01D9C95C.310FBEF0"=
 alt=3D"LinkedIn icon"></span></a><span style=3D"font-size:16.5pt;font-fami=
ly:inherit;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR=
">&nbsp;</span><a href=3D"https://twitter.com/EvidenLive" target=3D"_blank"=
 title=3D"Twitter"><span style=3D"font-size:16.5pt;font-family:inherit;colo=
r:#337AB7;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;=
text-decoration:none"><img border=3D"0" width=3D"20" height=3D"20" style=3D=
"width:.2083in;height:.2083in" id=3D"Image_x0020_2" src=3D"cid:image002.png=
@01D9C95C.310FBEF0" alt=3D"Twitter icon"></span></a><span style=3D"font-siz=
e:16.5pt;font-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-f=
areast-language:FR">&nbsp;</span><a href=3D"https://www.instagram.com/evide=
nlive" target=3D"_blank" title=3D"Instagram"><span style=3D"font-size:16.5p=
t;font-family:inherit;color:#337AB7;border:none windowtext 1.0pt;padding:0c=
m;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" width=3D"=
20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"Image_x0020_=
3" src=3D"cid:image003.png@01D9C95C.310FBEF0" alt=3D"Instagram icon"></span=
></a><span style=3D"font-size:16.5pt;font-family:inherit;border:none window=
text 1.0pt;padding:0cm;mso-fareast-language:FR">&nbsp;</span><a href=3D"htt=
ps://www.youtube.com/@EvidenLive" target=3D"_blank" title=3D"YouTube"><span=
 style=3D"font-size:16.5pt;font-family:inherit;color:#337AB7;border:none wi=
ndowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-decoration:none"><i=
mg border=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2=
083in" id=3D"Image_x0020_4" src=3D"cid:image004.png@01D9C95C.310FBEF0" alt=
=3D"YouTube icon"></span></a><span style=3D"font-size:16.5pt;font-family:in=
herit;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR">&nb=
sp;</span><a href=3D"https://github.com/frsauvage"><span style=3D"font-fami=
ly:Montserrat;color:windowtext;text-decoration:none"><img border=3D"0" widt=
h=3D"14" height=3D"14" style=3D"width:.15in;height:.15in" id=3D"Image_x0020=
_23" src=3D"cid:image005.png@01D9C95C.310FBEF0"></span></a><span style=3D"m=
so-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"mso=
-fareast-language:FR"><img border=3D"0" width=3D"70" height=3D"22" style=3D=
"width:.725in;height:.225in" id=3D"Image_x0020_6" src=3D"cid:image006.png@0=
1D9C95C.310FBEF0" alt=3D"Eviden logo"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:Montserrat;color:black;display:none;mso-fareast-l=
anguage:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"250" style=3D"width:187.5pt;border-collapse:collapse">
<tbody>
<tr>
<td valign=3D"bottom" style=3D"border:none;border-top:solid #E2E2E2 2.25pt;=
padding:7.5pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Montserrat;color:#4A4A4A;mso-fareast-language:FR">an at=
os business<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:Montserrat;color:black;display:none;mso-fareast-l=
anguage:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_--

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=1802;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image001.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=2165;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image002.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=2520;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image003.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

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
AAAAAElFTkSuQmCC

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image004.png"
Content-Description: image004.png
Content-Disposition: inline; filename="image004.png"; size=1662;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image004.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAF8AAABfCAYAAACOTBv1AAAACXBIWXMAACxKAAAsSgF3enRNAAAG
MElEQVR4nO2dPUwcRxTHX9B1IJncFtCZCFLfpYbIpDJdiEzPUhspuDLpLpKjnKsQBXeOcnS2REE6
XAXk631XBxTooJgVJ0FN9FZvz8vd3t7s7pvdmb35SaezJTQ79583b998vi/u7+/BFITwFgBgIaa6
N45T7Zjye7QUXwhvFQDq9Fmg70cJiznFxgAAbIwT/Hac6o2iKqdCC/GF8FBcFHwdAJ4ofFSXGuLI
caonCp8jRWHikwtx6fO4gCr0sBEAYK8oV5W7+ORSdgDg+1wfHM8lADQcp9rK86G5iS+EhxbeKMjK
ZcHesEe9Qfn7Qbn4ZOn4g2pKH8RLj3rCnsqHKBOffPqeZu4lKeiOXFUvZyXiC+HtkItJGh7qyu/U
E1hdEav4QnizFEGoDBeLgr0XTHEVRL79oqTCAwUK/1CvZoHF8qlCv3FVygAOMFzO6oYyiy+Eh7Hx
plnasYCj5dUsDZDJ7Uyw8ECh8wm951KRWvwJFz4gUwOkEt8K/4DUDZBYfCt8JKkaIJH4FNVY4aOp
0RhHGmnxhfDWJyycTMMTITzp+SCpUJPmaTolmi5QzQ+OUx3bC2Qt/8gKn4gWGWwsY8UXwmsYNh2s
A2ioYxdmYt0Otd5/JRMmT17ErQmMs/xcl9VKSCMu/BwpPkU3ZZ2hzItHtKAUyUi3I4R3ofl6q0l8
5TjVi8H6Rlo+LXZb4floRJUUafnW6pUwZP1Dlm+tXhlD1j9k+UJ4HRVx/e3tLZydncHV1ZX/0Y2Z
mRlYWlqC+fl5/6OIL8OLL5UB4evcwqPQrVYLPnw41k7wUdRqNXDdLajX69xFu+Ho54Hlc08Xo6Xv
7PwId3d3XEXmyvPn27CxscH5yEvHqfanHQZ9/jrXU0wXHnnzZh+Oj1l77GPyLj598WlQxTZ51mz+
arTwAfv7f3C/o9zgH2HLX+Uqvd1uw/n5OVdxhYIGdHh4yFmFvs5h8dlcTqdjzMkcKdrtj5zF1YLp
Zl98+g9bbH929i9XUVpwfX3NXQ3f+gPLZ4+pLLHUrfjF8UB8tpetKubm5oxRVgJ/qj4Y4Y5dbyya
3d2f/CkKDP0U+ODcwXg/sHwjJtJWVlbg3bv38PLlbhl6wuxUeMRlCmtra2VoBN/yU++yLZqgETY3
XZienjat+rNsJ1OKxHVdIxthqixhJs7HG9YIZrudKMKN8PTpmn4V/Ew53E4UOLnX6XzSr2IhKtJ/
aQg4qYfT2SaMBUojPoreav0F3W5Xg9rIUaGt38ZioujERYVuYzIOg0UPuDDO7Zi4G2IUxrgdFL3Z
bJZCdKJTwU08Qnha1CaO16+b+lYuHTdBnG+s4zSYTiB+uVa89aeHHseKXwy+3lb8YvAvTPLF1+GC
zwnjs/jE31y/f2Xl21JJuby8zFlcLzD2sPhs1o9rrWWC2Zj6OofFT3RpQxx4uODZM9at1YWxuLjo
L1cy0te5Lz6dF2KL97e3t/2Kmwyuhr169Qv3LxgWn2C9QfXt2z+N7QF4OgXrz3xE6CB8LGjwZMos
Xc/IeskFzsvgNmvcQKvzLCT21KWlr303o+BIEPJdOLKMOhBnb5JSw4MjQTDiEHTkgV1LZsYfBQVr
/SrA2H5ol8io3QvW+nmRP/4P1vo5GfL1AXH7dhp0ib8lGyMvvh4pPg26lGZOmABO4y66G3u7oKq7
GCYA9Br1qHt2AmS2C7oSf2MZphEnPMiITzmkXlhxE3Eqk+xGaqMsFcQ2319yLmUPlCfZpezaXQ5j
QT+/LpvQQFp8KtC14WcsO0lS/SXan08Fr9oGiGQraXq/xIcjqAFsBPSQgzR5FVOdTKGBw5btAT4o
fCpjzJQtiM7wnkzwDeOJXU2YTGeyJvwdkEl4YExSNks9YBKmIXqUHyvzLj+W04gYhjpOtU4JHMsM
5lVf4MoczZ4VlC7Ka5XwPfCz41RZF5nYz+FSJLRA+QPLAFr7N9zCg+pM0IZmgQ7o0YhVWQKHXHKg
G5L/PCC3POi5Zv/XvBFyTT4PeYsfQO7I1WSBHn16S6V7GUUh4gfQ+GCdPnkmqu9SRHY0brVJJYWK
PwiFqXUaNXMmy+nSILBDgmtx6l4r8QehuSPsHcHVkzJXUKLAKK7/re2RJwD4Hxzoh7w1PyU8AAAA
AElFTkSuQmCC

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image005.png"
Content-Description: image005.png
Content-Disposition: inline; filename="image005.png"; size=600;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image005.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASdEVYdFNvZnR3YXJlAEdyZWVuc2hvdF5VCAUA
AAHPSURBVDhPlZKxamJBGIUvIjayRDAaoia4xi2yhYig7CMoyRMESRkkTUSxEmyynVX2Aax9ArEV
kaiIhcRtFQXtVBQ79aznz3WiWbnsfvDDeOaco+OMhk/UajWk02lEIhF4Ly9luKbGvWOoktVqhcdE
AmcOh+HQQ+8+UkIxGo0eDR0beveLpCTx8CCbtzc3aLVayOVyCAQC+LE9BsftciGfz6PRaIiHXmZ2
aM1mU31DKpUScbFYYLlcyprw82azkTU9Oz+zRNv/H9rttohGVKtV5WeWaKFQSATX+Tn6/b6IRgwG
A/EywyzReF4KwWBQhH+BXmaYJZrH7RbB5/NhvV6LaAQ9X71eyTBLND4kCpxSqSSiEeVyWfnD4bBo
WvLpCY7TU5jNZjjsdtRfX2XjGI16Hd+vr1VJMpkUXet0Ojj5cgKLxQL7tsRkMsFqtarrI5VKBU6n
U4V30+12ZV8e2+7uf7+9oVgsIhaLodfriYHw6m0220FBNpvVd/USwpfov7rCcDjEbDbT1Xfm8zku
PB5VcB+P6zvvqBKSyWRwtv3Z3/x+jEYjXQXG47Eq+Pn8rKsfHJSQXy8vcpzJZKIrwHQ6RfzuDoVC
QVcO+avk/wH+AB6TTgm/9Q5CAAAAAElFTkSuQmCC

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_
Content-Type: image/png; name="image006.png"
Content-Description: image006.png
Content-Disposition: inline; filename="image006.png"; size=3190;
	creation-date="Mon, 07 Aug 2023 16:23:00 GMT";
	modification-date="Mon, 07 Aug 2023 16:23:00 GMT"
Content-ID: <image006.png@01D9C95C.310FBEF0>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB76802981CF9C4843ADACA274E60CAPAXPR02MB7680eurp_--
