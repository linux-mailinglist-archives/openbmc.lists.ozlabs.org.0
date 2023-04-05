Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BEF6D7CF6
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 14:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps4J14nVfz3chj
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 22:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=MHd0ZlRU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=219.64.33.120; helo=inmumg03.tcs.com; envelope-from=prvs=45278673f=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=MHd0ZlRU;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Wed, 05 Apr 2023 22:50:41 AEST
Received: from inmumg03.tcs.com (inmumg03.tcs.com [219.64.33.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps4HP36Dfz3cF7
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 22:50:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1680699041; x=1712235041;
  h=from:to:subject:date:message-id:mime-version;
  bh=bfvzchMcTWo5MICkaFJ80LgqkIYhF15Pr6LLTYc8/CM=;
  b=MHd0ZlRUiYvAVAnDVqSBLMNjdAy0lqgjQ7RYXnRK4rb71ahniV8ulpVC
   joAMbfRyjVOquuTfv00Ta356SmOUf1nMgpzcMLJCc7C3uJW051iA8tyR2
   Rc4ZTNMmKXP2ZvwHjQcVSixeeYgFSj9CDMAaN8WsmjZvkHMZg34qEuIAt
   mWCZ763nO4+v3KsWlZTMcsTANfFI3lqzeW09WtKdAtQKSwWtvt9RT0TqH
   tIEry23+FkFs27K4Egh6fk/buZVCwaKDMSatORoWDNOlleprW+iv9/6sW
   q9rhcusUAaNC0vaTYz1Op/bV2o29yvNk7e+J5DgQWgW9yPT5qhDeje5pC
   w==;
X-IPAS-Result: =?us-ascii?q?A2AMBADkbS1k/1fyEaxagQkJgUaBK4EDcwK1OYF+DwEBA?=
 =?us-ascii?q?QEBAQEBAQcBAUQEAQGCEoJ0AoU9JjUIDgECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQBgRyFLzoMgjcig15eAQwJayYBBBuCd4IVR6xIAQEBdoE0gQGCF?=
 =?us-ascii?q?ASdRIFngUGJH4NUFYQygk+BFUOEeIJzhBKCLgSJeo8yaoE0dIEgDoE9gQQCC?=
 =?us-ascii?q?QIRa4EQCGaBeUACDWQLDm+BSoMrBzYDRB1AAwsbJjQ/NRQhBQRVgRkkBQMLF?=
 =?us-ascii?q?SpHBAg4BlARAggPEg8sRA5CNzQTBoEGCw4RA06BRwRxgRtRohWSZ5xxlC8Hg?=
 =?us-ascii?q?38FgVSfShapQpdyIKdVAgQCBAUCDgiBZQJjgS4zGiODOFGiM4EyAgcLAQEDC?=
 =?us-ascii?q?YtEAQE?=
IronPort-PHdr: A9a23:wtqzRx/fbVlqd/9uWb68ngc9DxPPW53KNwIYoqAql6hJOvz6uci4Y
 QqFuqwm0QWBdL6YwswHotKei7rnV20E7MTJm1E5W7sIaSU4j94LlRcrGs+PBB6zBvfraysnA
 JYKDwc9rDm0PkdPBcnxeUDZrGGs4j4OABX/Mhd+KvjoFoLIgMm7yeC/94fNbwhKmTaxbrN/I
 AurpgjNq8cahpdvJak2xhbVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3U
 bJXAjImM3so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RTKv5
 LptRRT1iikIKiQ5/XnXhMJukaxbvByvqR9jzIHbe4yaLuZycr/HcN8GWWZNQMBcXDFBDIOma
 IsPCvIMM/tCoIn7ulQBswWxBRGxD+3q1z9Ig2X53bcn2OkmCgHJxgogEM8Qv3vKtNX5Lr8SU
 eOozKnN1zrDdehb2Svh54jTaBwuvfaMXbdpfMfX1EIgGB/LgE+Kpoz5IzOayP4Ns26D4udvU
 e+iiWAqpgJ+rzWv28oglIjEi58Vx1zZ9Ch13Yg7KNOmREN4btCpEJhdui+VOoZyXs4vQGNlt
 iY5x7AYpZK2ejUBxpc/xxPHdvCKcZaE7gj+WOuTOzt0mn1odKylixux80Ws0vPwW8io3FtEq
 ydJj8XAu3QM2hHW8MeLVuZx80K81TqT0g3e7+NJLEYpnqTBMZEh2KQ/lp8LvETGGS/5hVv5g
 beNdkUh5uio8+PnYqj6ppOEN497lAX+MqM2l8GhD+o1LBYAUWad9+qm07Pt41H0TbdSgv03l
 KnWrozaKNwGqqO7HQNZyJsv5hSlAzu439kUg2MLIVFHdR6fiojmIVDOIPT2DfelhFSslS9mx
 +vcMb3nH5rCMGbMkK/7cbZl6E5c1Q8zwspF559PFrEOPOnzVlXtu9zfCx81Kwq0zP3/B9Vny
 oweQX6PArOeMK7KrFOE/vgvLPWUZI8JpDb9LOAo5/n2jXAnn18SZqyp0ocMZXC8H/RmOFmZY
 WH2jtcGEGYKuhAxQ/fxiFGYVj5TfXmyDOoA4WRxD5qrC43GTaipgaedx2G8DJlfbHsADUqDW
 z+8cJ2JXf0JYwqWI9R9iXoDR7yoQZRn0guh4lzU0b1ie9Hd/CEVuIqr98Vw7vebwQo78zB5A
 tzby2KQSmhutn8DXHk926Up8h818UuKzaUt268QLtdU/f4cCm/SfbbQzO1/Xtb1XA+JPtKEU
 02vTdjuBzYtBskwzNkDbwcYeZ2igxnP0jDsD+oTkLqGV5Ax+7jXin72Ics1wn3a1a4n2l8hR
 MYHNWCviqNlsQbJAIucj06C0a2tcPd04Q==
IronPort-Data: A9a23:MAjcO6kDWNOaAAgxbNLV5V3o5gwcJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUGiCM/qLa2H9eN5xYd+z9UNXv8LVzYVhTlQ/qCk2Q3tE+JSeXN+ScxahZHjNIsfIQRM4s
 85FM9DNc5s/Ry+Fjxr8abKJQVuQdU2rqhgQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzA3f4nW8kWo4ow/jb8kg34Kyv4GpwUmEWPJingnePzxH5M7pCfcldH1OgKmWDNrPSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQAbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WH5dixqPOI1OGr5Kd3VD5dnvv6N9cAxRjVWEY0r4f7WBm3
 tAzFBwpVjW/rr3eLLCTE7Y2wJ18apO3ZsVP5RmMzhmAZRoiaYvKRanH6McexDQtg8lUNerVf
 IwSbj8HgBHoMkQeaghGVstu9AuurmffbXpXmEy7nop00S/C7QJN7OnRG/OAL7RmQu0QxC50v
 Fnu+Hz0BBsfP/SbyCGZ6TSrlOvGlzi9X5gdfIBU7dYz3wfVnzNVUkFMEwvkyRWktnODtxtkA
 xR80kITQWIarRLwJjUhd3VUeEK5gyM=
IronPort-HdrOrdr: A9a23:JiUj4aMeLMRkUcBcT+7255DYdb4zR+YMi2TDiHoQdfUFSK2lfp
 6V8sjzjSWE8gr5K0tQ5OxoWZPwC080mqQFmbX5UY3SOTUO21HYYb2Kj7GSuAEIcheWnoU2uM
 sOAssOauEYZmIK6voSlTPIaurIt+P3lpxA692uq0tFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 6x99dKvD2pfFUQd4CeCmMeV+bOitXXnNa+CCR2SCIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zoghH0/aKqttC801v523XI55pbtdP9wp9oBdCKiOISNjLw4zzYKLhJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kdh11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KAoM293amJa/hZrDv3nZMQq59Xs5WZa/pbVFZll/1dwKqSKuZGIMu10vFgLA
 AkNrCh2B8fSyLkU5mehBg//DRnNk5DRytvgSA5y5SoO0I9pgEi86NCrvZvw0vpsPkGOsd5Dy
 GtCNUyqFmLJvVmMZ6Uw486MJSK4yX2MGPx2G7+GyWYKIgXf33KsJL5+7Mz+aWjf4EJ1oI7nN
 DbXEpfrnNaQTOmNSSi5uw9zvn2ehTKYR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR6aLFxqkJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObonnrPbSfvrfLKfkVTwkRmT8CH
 0eWyWbHrQJ0mm7HnvjxBTBUXLkfULyuZp2DajB5uAWjJMAM4Vd2zJl/WhRJvv7XAGqnpZGDn
 eWeomX4p9TjVPGjlr10w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.98,319,1673893800"; 
   d="scan'208,217";a="919879618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxxT7/aPL8o96NAJhz4X9guPbPaaTyEJMtIr8j3YiRJ/q8EIeACpdZDKJBytDtIEMjJwHeUbCebEtgX5zrlaUTiRU7M7fYnCNR0MS1SadjPvKI+YuyavT89BNM9zkAFYCNcyee5we9vXQyJq5FdnhyMv4Jy1+tLvIc3WFVzLQ+33FotwYves0tat5vcDbn0FMZRG8Ty6iJ2ELTtckhtGzPW497sEy7koI0Uoz4leFG61p08g0rsDstP54YO7CilgJ/UnY3EzVbjKIKys1/XZCIajBuU/a1y07d1HIPFqDIL8fvZdDcd8qEwqPQvXiHSqyPBemwB0h97SWQItBmRF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcqe8VBwpye4ESxhLy2v0t/3GmJv1fAEPOPLvktl1q0=;
 b=oG7Z3dvV2vgftFBU6043oXtjcIjXMt3/e36b7yLyZaS6ZtbCTlT8X16TIspMEIq9RxuR0Oi5HVtYPGdsb0qji0Dj5kQmeB0xjjCgxOU48ROO/d1U2pV9DZ5w7Y33RQX+Sm2cz3OvMDZgbL00+zizhYczLWnOo1muG27u7nLYBaDiM2T9VcdgjjAAd8osRgzwrEhUaGnv7eZhLGEML86iyoWOwGZy9APGDP3arSorNB/6R/fuz/T2P/8lN5BVfx1LPmZ2SZhCXl4h++lhNW5Rhexj5e9CKSZqkMkrUlb8sNtmyPW6YbLHhdE/KBK5OBqdL7GS1qrvWqBPCof7HNeCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Topic: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Index: AdlnvJ+n/GpqnOWCTXuloOzDKwOlRw==
Date: Wed, 5 Apr 2023 12:48:50 +0000
Message-ID: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-04-05T12:48:48Z;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=c53ed4b3-a9eb-4218-a2cd-9214e0e34d38;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|MA0PR01MB8117:EE_
x-ms-office365-filtering-correlation-id: f84fbced-8f02-4ce7-6885-08db35d41b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: csMF7ithiwKHplVOVGm0tn+q1AEC/YNrVsGJlGfSceN9msjTqgIUx9nfuFRyD+wQnGR9pJfzjWrGfu9YUxG4gLBQz0WpkK95AnTfjBH4NzXymM4FSZQB+TJ+710YpByX/XdpmTWLEYLUV8UVV2HC2P1jS2cw2toXrExM+5TGS2XkaOfDd+jo2GbvtbCH6/xMHqhrjmOBobIUCNf6dsMRMjN7KbeSrR2NNkZkS61QoDPVMRtC9AjqlzXQbaqx9orNSbM5uFpaSso7FwMsHBiZRZacBE+jlWIEVmfhx+3CvFcBcEq2epRGNCA6CGDsIQ6VBmlWpaUEjikmSsPhzYvnDgTSW0MWIas/4w7fi4aEoTzr7zDIsrmNJt+aLipRDE4xxoreiaEH77f3kdKvkpqBUHqH6t/2CDItqHv/vdZ2tPnUsteQJocw19Su26nGOmdhoGDbkXixeRmir+PbAM2ltdkpYj0CCdnmvTAc6oaztrpkdNqdqSe78GCJ2DYgtrlIkY6jnhX/m/fd10D4ijG5mPNzPovnlyOU+P+irTrXrHZNyAukQz8YBhrMDeW7tFa8aOEmf9sBhz8Vb2OUrgjaB2mEMGpy7EGOBlfBnJ+VSPwE6bVFGfskq6/w0fvXzC83
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(55016003)(26005)(76116006)(9686003)(6506007)(186003)(52536014)(82960400001)(86362001)(64756008)(8936002)(122000001)(6916009)(2906002)(8676002)(38070700005)(38100700002)(66446008)(41300700001)(33656002)(478600001)(66476007)(66556008)(316002)(558084003)(7696005)(71200400001)(5660300002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cnvp6Ny2AMCLUoENJmc5FKbPTzxTM8l3a+Dww4ykhovTIaZPGI8g0G/VsIWQ?=
 =?us-ascii?Q?max9ey02897iV44sHENASL2ssoaVZYMdOpIS9L6tEdndBilS0X5UPczklPf8?=
 =?us-ascii?Q?Oy9Ep1HoVGjZ+JA+3OHApSBggimadzmhelvf1gCMMphQ0y16rIhohg6T+SVF?=
 =?us-ascii?Q?Oqe4EkFzQkUesgjEsJT3oitCzm2Pj+FKh3oZ3/6kYnV+VPpxeMOIBmiRR8V2?=
 =?us-ascii?Q?1Z07hfVd1IoaCYjicwO7TgfVAE7SSwIslLNB9IiUk7IerkycmxdQZhT5deAR?=
 =?us-ascii?Q?NB/sTP/1AAOsCoY9TLkZYT+uxVYwY4Mt8ggAncf9AQb6XlHUrwQ46MPWLA2Z?=
 =?us-ascii?Q?urptdDX7utFA+Alwp5XmBz/wqiGseh8lhZ1ti2QGlhKA5YAajLL0CUHbXOj6?=
 =?us-ascii?Q?UUzE+xX0pLWgp0QG20U+HheKQZ0Iagvvn9B7UXR1fP/qVfnr7eE7p5Pi+Rag?=
 =?us-ascii?Q?F71XYnpPSPKMgveVGqfZ6Vkc/6GpKcvKv7W2NVZ2oscal8MtQLpNrBEmI9Mz?=
 =?us-ascii?Q?+32N2/eJVVEM+I1m5CQ6HYcOcJJHgsTryXi4CBMJSguEVj+sQcVZPgnYuNJJ?=
 =?us-ascii?Q?5ybJUED6uITiMAL0+j/mk2ja4e+ld7rC1RMGBgUN82yv4Kh1LuNeBLJDmu9z?=
 =?us-ascii?Q?BA6bJNjs6YXyjIfwVyr7IpNQzfh2yOpe6lTFx1cRVVG+BnXZI2XLxI7cLzrK?=
 =?us-ascii?Q?qYVhJnIN5mBmPRV57o2AwMyOwfvWCNMD0qfcjSO2haiDc5A3pVslHt0jYwvW?=
 =?us-ascii?Q?2fGceLmPScP7oH3epQoUQZqKnD8foyxi5rd+VCRDjP2T1VTz7r+IS2orfc3x?=
 =?us-ascii?Q?y5TjBS1khHeWpsWLjC5Ql2CxQ7jyulyDJogK+fMdrFIZpcEqYkSeGS/l8m0J?=
 =?us-ascii?Q?LnTBcswnBvD6pvWigF7MVieIh071PaH50TvPSwsqoKZIxXyx9Vj8hXvxZ82J?=
 =?us-ascii?Q?ueIUBfHlCp4kdI0heFygvj1s0uEopgLv7PCjyLKSNt3LrG8xTcXiSMCoZUtZ?=
 =?us-ascii?Q?+PXFp6JhmoDkP8lqMkSmX+X4l7sPclwI/5bUUCU0byuUf8UMKzoMX4xYijdK?=
 =?us-ascii?Q?0excF8uCny6R0PGjImKyQL/sN18/Zauchavv+vSNRohAGYBsBV0Z+OPj4mzi?=
 =?us-ascii?Q?xXR9DiL0HH/0WqEBRR85ze0XpimDULCUYhIFnKR5S5ZaiAzTxTY6G2Oy08p6?=
 =?us-ascii?Q?fueKOQLA8FtCKtkJZ9K/8g4KupFcIqTRyaHbzFSqKfH5hK/mhSnHV/aofJ5n?=
 =?us-ascii?Q?ouq2UnqjMpEOimw4WFvqdwGwOwn2enYOeZcbO3NWKOHJfjbVsSJ7weJmctqV?=
 =?us-ascii?Q?qkiiCV2mk20K5qyD1meSCGx0l1iVIOn0gYaAniwSI8QZSczYcEAmEE0DtvXs?=
 =?us-ascii?Q?65lj+rW6yutb3VId5MJS9V8H0HOraWNuBftEZUpbwXFbT2xIvgVSXuTtTFrB?=
 =?us-ascii?Q?k4w6MIZ0cOT5cobmXhpTnGnYbrCm5kJKsO/nsH4Am6MXMr98t9axFOVvpR+8?=
 =?us-ascii?Q?SozlmERwer+jQllKgN1ihs2VmK/pIwoa7nlD3ZCz8oNsw6HDWMO5JA0aFMvG?=
 =?us-ascii?Q?XpGuJ9le5u+gpVi2nyo=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB412922EF629403C84674A6AD87909MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uW3Dl0c4aZU44L2imCu0ZeOAqkdlj8sZ99ZPV3EiroAlBrG3lkumC45OjZcMRqBC5x32O6TLCw5esDPzsbggU5bXGmO2UeB5j/wq4yWvx/KDkPA2K+N3wB2mSoMs8fQ6LS1G24BEZfM++Og6KVhw20d1fk9vjZ6+Aa2Ek8Htcyo3ircciq6YvfdAljv8+qT3E9zsPLaGg/gDwCEbwvd+/N+u/eVfy+v8E3k3Yt9Fwyn3X4iA/gXEvbVTEY0c2+pyIa+3U+sTb6jEHMpJwXUQcFwKv1CeSmx6LLcQzyg8RuyKk2hVP/SR2kmonsw3F9t6Xn1pLjNaXM/rWPO5ZRD1rrSei0vRZBfAfUcPpMTWbp+wfgNe2GFLwpCl9qTco2qj27R/YAgXYgOjnGWU7taLH/Ie2FMHNLQZExvrGwcK1AA/UUlRDLyEVi5v90L3i/gGPHRV84yHkOpadyP3vb/MGE/btxWrOW9g4uSrVUuEHLv/jYxROMTm7u2PVxtvVPeSTN1Dh8bw5tc3Qe+hCk1M0uzN49YgABxhesaiScHtkM6o+0Y5SnjbukpSEZ2mw9MkndBDu02FXhAzGjoYahBVi/qq73h+uElAVfTLtiflj1ajs6GnmPB6UkW1on+GzmbD60TGEWL3Z7MxSPZ1OY46Hi6025OzrJL+IjuaQuwV8iq/0vIb/7R9VtbRME8j1JD0hpmxA1Dw1gy7pYQxue+FeEW93UjNVYTHTcFZ3E3paUmUS8J1gAr1v+r8I+HpCT0Fxl/CTIsh2PRPJnbQ/1/z4LaRZn20gis31LpGoQRzwzI=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f84fbced-8f02-4ce7-6885-08db35d41b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 12:48:50.6384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSLWbwEOVFQEMkbxmPYIxSK7Jx3mjFTVHwIsemuyCQaS18bK9KUOvTcqLPa2sf60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8117
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27538.000
X-TM-AS-Result: No-10--12.715100-8.000000
X-TMASE-MatchedRID: 9luce4FqTPrr0qGBvdXjxBvMKxHA9efN9avse85ISVrkwMCV+cVEagcE
	3AwiiNlytsDkvuS4EQsXlxePCzMBLEdb73gUDwkXKwi7MItzaY3qvccKLF+4pxziuLhElX/Vb9E
	MBlN1IjcP4aT1dGzYAYPbw023vELIhbTQ15Ff4GvfSQNpZkETVNBO21OxlsovB4N9b2b2Ot5dH+
	Gf7hAirWUBu1X0Aadz9yaXhPhnUZ1FLl5Fk0ov0dwWRN30KO5Pd90yS//gJoZf0yVReoVM7TRif
	7JSrYOq515WlqfwoXxF37kzro/Xgo9oUcx9VMLg/sToY2qzpx6mHa6PLd1EFvoLR4+zsDTthUfR
	2rvBju6nw52XVXCkJMykghTqGNe08t9uQf7e/UfIEutCGGbKmiU+FhzFBiYYh9qRHsiqw3eM6Lj
	k08KDxMw1PdI0og9b1UIMXv3gvnrThhl5IR7yQlgpWCbva+Mm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.715100-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27538.000
X-TM-SNTS-SMTP: E89B1C185E3EA38EF21597D691D2F642C4D82D189DFE24FA3341CEC6B49FB2012000:8
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

--_000_MA1PR01MB412922EF629403C84674A6AD87909MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi,

Trying to see how to get swtpm working as a virtual TPM and connect to open=
BMC on QEMU. How do we achieve this? Main idea is to get this working and m=
ake secure boot through the virtual TPM(swtpm).

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



--_000_MA1PR01MB412922EF629403C84674A6AD87909MA1PR01MB4129INDP_
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
	font-family:"Calibri",sans-serif;}
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
<p class=3D"msipheaderd4f7db42" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Trying to see how to get swtpm working as a virtual =
TPM and connect to openBMC on QEMU. How do we achieve this? Main idea is to=
 get this working and make secure boot through the virtual TPM(swtpm).<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
<br>
<p class=3D"msipfooterd6682aa3" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
</div>
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

--_000_MA1PR01MB412922EF629403C84674A6AD87909MA1PR01MB4129INDP_--

