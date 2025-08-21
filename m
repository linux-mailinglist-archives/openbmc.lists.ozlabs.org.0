Return-Path: <openbmc+bounces-495-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E82B2ED9C
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 07:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6sSL2x6zz2xpn;
	Thu, 21 Aug 2025 15:33:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=148.163.156.1
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755754434;
	cv=fail; b=I5NEG8hsHELCl+ImjstabjpEDbZjlEV6EyL/LSlFFJ3MSXHmWW1U9eBAtLHRMWN5QbYygX4HXc4PDvlZZQEwbtWg7bKYBPRGruBb1FKVbxsUXCBJX5YaaqDdInpqUMuTrgmn93lX1aQXNmF05vtgzM0+uraXMRj76fyI69eQsUO+MLSqtljC8c0WCBXewj/zocv8/Remo0V9pNJboPGGiXzKCMwTmsUyg6BU2roL4Ifo8fY+HzI1D5o0LaB5qHSgAKau9IK8aa7SyYcMqNkKP/s6QeJ6TdbzEOgY14IFuH55eUTyHJeKfWYPXDOSgZEp7G/1LnrCm7YUGL35LtWNSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755754434; c=relaxed/relaxed;
	bh=2UHc3r+PQhEsY5KerlBF3FNkWb1yfFET3qZlaJUKKps=;
	h=From:To:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=F5TdC4at3CKXGFG17cLJp3eVpHpBQsQ7zkX2F6Ay7IgwQINttWVHWqp3rQ4ju7fvmTCuS9Ofdy4u7FXOe3I21pz2bhZVp8iZkXvXQ6MepK+vIJoTCDmiEXQUdbXU+CRH6NYuddfkZqT/DAy/n3rx+vo7rkp0QA1+XN5sKuswoJOuBUbdxWpn4e3uPG+/mSNI7okNSJQIfrHN2TzG4HXfIZ9SW3OZ67xqC11MBs1D0z2uEl6jEvgSiuwIEifiLCIaGH7xtfzslF5v5DcRPnU+nS05Ed+7cY72nVPnGiYz6pT9EhWd4jjGHNgJwr69mHTznJQVvMdHZglu32Vr+710Gw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SjV/DD0v; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=in.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SjV/DD0v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6sSK44RFz2xc8
	for <openbmc@lists.ozlabs.org>; Thu, 21 Aug 2025 15:33:52 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KNA2NP012643;
	Thu, 21 Aug 2025 05:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=2UHc3r+PQhEsY5KerlBF3FNkWb1yfF
	ET3qZlaJUKKps=; b=SjV/DD0v9Yf00nNi7cEGazcmqDfx7yazwVa91OHchdmlQp
	QgmWz62mYGSUBn3pZMPmr9wC1d1Grwyc4KhCDyH20B1PKB5UXlQ+Yvs4zCHBJCQs
	dBQertqz9HXqF5x8uLVIA5CnGgOR9DVQHwqp4fF3xGyinrurLp4NAw+x8ihKZI7C
	CIdKdDdX7OfnAjUWd800jofR5/TCPgkZCgtl5sYEhTZ+uzXhTazjOEoIW+s13Tao
	EH/lsWidoXVnGJaiCS6AdC7x2VY4zbKurKksZn8IKLGaE7RF0SiS4VzaSVSeLWfz
	xi0PKYhKudvAyY6g4TwyLHYSHlKRsvWXU7UAEo5A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48n38veutv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 05:33:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlHpfstJGoJUi2CIWlvebcr3ixMmkLnvvFBjrb8mJNy+v80nIbi3HJA95kM2WIF644ukWvLhxscNV/z2zvX9keJr51x84u/SoV/KGSPLTkTRCSltADVvziQFYW8LM5VwH0b9WFwmZkUdFYql4wbNBpXNgaZBVu1St6Yil7b3Ov9kxwtM/aLHJc/0JEtpAfxgvEsS7N3JB1XnvFvIvzoyGe/50Biew/yTR+8ia5odsg1oCUNQv54xBdqxma6mUqHNuHLx642A6mmuK3tkWh66PlHmopcoLGZeE0vp8nwHmT0c2Qke4MN2jVqwVgXJnNirkqhfEAvvvHfH8/hQ4AXGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UHc3r+PQhEsY5KerlBF3FNkWb1yfFET3qZlaJUKKps=;
 b=esvTzyBJCXinH+F7nrn/k5U75mRlH1rCxN5j2UYfHhEG1qx8NzeRbfm+R1rBfa/VgVRzynIMAeoX4UVBjEo57OxNA5+qM5Axuid/kcDDie17mt4tpvazc8TncbVz6fAwIg4LFQ3u97O4NCV5NgZfOYVviaXHlei2Us3SjAmTHAe1aSO+5z4DwHWklIeiDBjzFqvAmu8wR4nPKkrTLiO2iCwdrLJy+SgRHpkDX5jFPVNq4l0raQNV2kKosAaSGxCzjKvP0tU6rDSk/9XSwR4EBPWGsqSTcpP8yc6OR2gSL11RuW8ZM+/Zqr6QKHgu7s79j4OFumAd3twvKDQ52m/mgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from SJ0PR15MB4469.namprd15.prod.outlook.com (2603:10b6:a03:372::17)
 by PH8PR15MB6092.namprd15.prod.outlook.com (2603:10b6:510:254::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 05:33:47 +0000
Received: from SJ0PR15MB4469.namprd15.prod.outlook.com
 ([fe80::c1a3:c1:6717:d74c]) by SJ0PR15MB4469.namprd15.prod.outlook.com
 ([fe80::c1a3:c1:6717:d74c%3]) with mapi id 15.20.9031.026; Thu, 21 Aug 2025
 05:33:47 +0000
From: Marri Devender Rao <devenrao@in.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>,
        OpenBMC List
	<openbmc@lists.ozlabs.org>
Thread-Topic: [EXTERNAL] Re: TOF elections for 2025H2
Thread-Index: AQHcEUl4zgap5UppVkiOSyfNhIx02bRsl8Lc
Date: Thu, 21 Aug 2025 05:33:47 +0000
Message-ID:
 <SJ0PR15MB446982270CCD58376C6A8BF1FA32A@SJ0PR15MB4469.namprd15.prod.outlook.com>
References: <aKOKlY97pOtfuaEv@heinlein> <aKThH-wUWmqyCisX@heinlein>
In-Reply-To: <aKThH-wUWmqyCisX@heinlein>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4469:EE_|PH8PR15MB6092:EE_
x-ms-office365-filtering-correlation-id: b62407de-b62b-4b83-4e73-08dde0744d47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|13003099007|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iDJrnE0uLWb6Rpo+MbC783wBOIutLIMIkjAqA1Xbc4IYBvzrWhIOlvOGor?=
 =?iso-8859-1?Q?irYK8btSYs+ZUh5LpHApoAet2a/8EZOKlhoHrMnOrpmh0Q3DMQUunnflj3?=
 =?iso-8859-1?Q?uamGuB07lvjYQrXNE8cAikpbjf9dB9UYUjmpy7bjpLWdi5ogV1XyWNHFmQ?=
 =?iso-8859-1?Q?hK4Cw8A1n9pFwsbJIsNCOT41B/eyle8kep5DVA3Bpvhd8Dsq9qOaj+171n?=
 =?iso-8859-1?Q?/mju2nnyHy/thM+imDVTNnlgsosg3wfTLMtaWSY2O+LByCGKNmBiNFoMX8?=
 =?iso-8859-1?Q?UXi7/8LHbbBwoceLbCu+9XsMUCwer6NPytyJFW5gBk4q/Uiy/FHp3FUxbY?=
 =?iso-8859-1?Q?h1xHxWTG7GMdlrwm7brN22QfMDzPMblY1ktStDYTYFtGQDm/2g5G7UZlTm?=
 =?iso-8859-1?Q?i9B1UQdECP+eJBQlpA9gAUxarl1zzIJu0pqakXqEzxpoP3WCJjSky6El6K?=
 =?iso-8859-1?Q?oPQ17wJ7DvNukuRGHx4xc9HODu7mP2wSy9WJUSKE5Rse5y5frPQozh25g6?=
 =?iso-8859-1?Q?KvMZKgQ7YMHg9HWbGjiKFddIQ2QLwvDPG+Uz1o7MQqGfuOIMAhTGPiqfXf?=
 =?iso-8859-1?Q?sAra5oO286dPn99Kcg5TqKNM78R0beY8tmUueRJtnJv1Faewp3niyNC2dC?=
 =?iso-8859-1?Q?yTV3o+eRNjvVrIO1OckNKZo5s2jQkDrI+57w6h4FyaB+3cgY+ZXoM0CShZ?=
 =?iso-8859-1?Q?mYyp8DUyZRz+9W3+TOf/7doyJ2TgLAS3/vJ+G/X+3o6YBQeyOaj7HyaQoU?=
 =?iso-8859-1?Q?hnYHCyHMhRf1JS8AdXfubc7XDyowKI0ivx0/W+UVy9iPrRfzanhGMbLVpc?=
 =?iso-8859-1?Q?DQKewW83QbgUbmII6GYZLlBAZirLqbDZuEVZJPMjCusDyXnKzvgzIvXyyw?=
 =?iso-8859-1?Q?y1h/HOfXTxAqu79Xkhw1Uk0/O9DtM/OhZ1rbLY++s1MolbLylNeSJ8EG2t?=
 =?iso-8859-1?Q?PmYuD+DMlQFiZJQNfndxk7bjfNONGFdXJxTKdfd8+MBfpp/Jmn/ZZwqzJo?=
 =?iso-8859-1?Q?AYXN/beu811W8cFLY7qrqnW9tTv0MzAAEs/8b7MYVfvIfc5d/EJb+j/fUS?=
 =?iso-8859-1?Q?yHIKrPphAbZ71YvA1hZqwSJuzEGWFv03MryWPD+EZs0grNNVK1Yi2ojb8q?=
 =?iso-8859-1?Q?jO8NYmKEsN17kZh9n67b9COPv8qyG7dD84hkCof1RVqZJSVSdOR0ca2Hxx?=
 =?iso-8859-1?Q?JOvoo0lahLf5dNiE3Q3bJEWB1KBcDrTqYQ4sXgoHjvkfGqvbJlOsMo87Qu?=
 =?iso-8859-1?Q?HislFIkDk9UgWYF3RZd45QD6GizuS3jcuuSOV/SEPtB+A8jwPMStDJC0I0?=
 =?iso-8859-1?Q?A9Jv3clrRopw9piZYcUKkbqfzn9i/YCkmaO9R9I5hI26X6qY67RozJh2KR?=
 =?iso-8859-1?Q?TLzUgF32fPqayVX7To9AWO4itCkVoE5AWmDdus6a3G9VvQ7JAmInQcUeYn?=
 =?iso-8859-1?Q?F1OChwbG29DGKcDrPYytgUJmduTFxXdg5GlGFlMQH9Ol5qgbF821Rpo0SU?=
 =?iso-8859-1?Q?xMWAPWNi8klL/vDOgxyev4s9PkQuSORM3vLFaPcq8jTyAwrnAFZRRYZobz?=
 =?iso-8859-1?Q?DCVJm/k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4469.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(13003099007)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?46ERjyoiWDcHlAAY3/zeE8KGLHwv9ufCngj445nbJCOlVhWpf9wOU3YbOi?=
 =?iso-8859-1?Q?49Xd9f1aqfMQKL9U9Y19yJboo4DXonIXCx9ff47tOX2QzOzhweKW0RRHgQ?=
 =?iso-8859-1?Q?3zM8kmZprrhuCO0pbpDgyILwyXv3qQx0w/n+sbWH4SyXlDUnKLi2PqhZ2q?=
 =?iso-8859-1?Q?1lXLuFa41Xn9QhbyN000QSC8goGfPRF/KudZF4LHn6kexLGRiTdNy5Bqda?=
 =?iso-8859-1?Q?w5wQIzPTHVuIisdLiNLtY5rqlsRrDgC4olfRli6wuLlAXz/zQrozODEbYf?=
 =?iso-8859-1?Q?TUJZeLxqhnMLSGLlNee8yaQ4Foyhoi1n5KFow4Y5vgCtu7vxNLlW3iqE1K?=
 =?iso-8859-1?Q?i+2d3d+AEFtDUzrnUUguliH9sZ8odIH0vnXud0iUdgeeFKxYX4H6z37+wI?=
 =?iso-8859-1?Q?NoGC6bK18xns8h355oZABaGrA16iC2TTEAr3h575Ra8Rw2towmzX8F0emj?=
 =?iso-8859-1?Q?LF1AFK1ZoqXnbjwRiLbgLrACNbhTNQGSPESmsMMapTMLOHvqvimsrSY+Po?=
 =?iso-8859-1?Q?HOlPC0McvIkbHQHndb9/YxchM0yDsTxGu1577jOE04o2m3aGimtkX+yqsx?=
 =?iso-8859-1?Q?XNO+GYNor8CpUaAqj8a/RzjWbAZYDv05xeRuaH+KYE9ofT7WfQ66ASQe71?=
 =?iso-8859-1?Q?DnnFdScuLdMR3Y/oYmc5EBxQUrGuxXXm+SjiYFyqXxgl7TSPZipolIFA7G?=
 =?iso-8859-1?Q?pasJSR+CtHVAHzY/bwXEA3Go1fUrAy8g8so40PhSOn/lBYg12CHbQR2kZl?=
 =?iso-8859-1?Q?YaPAqYFSr+a6cS0g1N6V7UI5JGmLX2p0MSREvQYv7kJUSXZjef6rEx01GM?=
 =?iso-8859-1?Q?05/aLJDfFOwwzuwkgfnyrj9UqI9QktysiqXWfoZKcSZT0zHYPPcBjJ3VHh?=
 =?iso-8859-1?Q?OEQH1xstat9rZuWu83nIrxxf9p1chaBBatcgwRnJrv41y/lfetJVHjjnLw?=
 =?iso-8859-1?Q?wGjUIc6cpmm7ddPuhFGsRMi+h6HYqA/vw9FW+SSWqIX90aFqn/x5An5W/f?=
 =?iso-8859-1?Q?AjYGvWoaIXYLsw0aWlRbc0WRRh+Y55XTnLzzu4L9+NVXsxBPkiEW6Xsfhu?=
 =?iso-8859-1?Q?s0HsPdTDfzJj3quJpwF+NWSGbTNXTXn0Sd7US6pSeEaX05QSXcDrAP7NY3?=
 =?iso-8859-1?Q?jKol3LlYHkPJjT9P1nrfC33R4V0Qf85YHLMRnVpRIzea+l40FLVe6pEjfM?=
 =?iso-8859-1?Q?tNEa1lnMxFN8Xue08wmj/E/TnLKm2Whui6PB3QIulOsNb/IOGTMr8i5x7R?=
 =?iso-8859-1?Q?TIv5EUAXKV8mhiFzbN2FV0UoOKxcRhq02N8u8nXu9ypD6kzynxaL4IuxFu?=
 =?iso-8859-1?Q?h8x1zwT1hPeIjrCOrV4xI6dLWsLrutxmrPZW/z8XFsAUZZPkKQ00a0PhW3?=
 =?iso-8859-1?Q?CrSwCzVUSZrU+WVvXp4oOuCzmsrlY3+p1Pc85xVnuSDe8OHLcH+5aIoqX0?=
 =?iso-8859-1?Q?vZXR6i611YepbHZD/h/lFze8AZ6Xu1OkVMiivdfu/GpQgk88/V+XPBDqWh?=
 =?iso-8859-1?Q?ZxLz4pE6O8HZbdPo3WYSlm86eO9mKCmg6NHj07wfLGmRp97hczgLmQA9Rk?=
 =?iso-8859-1?Q?jjhA+QrKzoccN4XqnTFRjFAjj0zPtnIwVaKPmeVDL8MSVfpWaNPiKOys2J?=
 =?iso-8859-1?Q?YHPU6+gsEi0AFsqU0+3EpsFqZ+GJCaP3nh2dpX+WP4BKu7GXQjeRjjO6T3?=
 =?iso-8859-1?Q?q3GUOBo7bnFJLulrGTE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR15MB446982270CCD58376C6A8BF1FA32ASJ0PR15MB4469namp_"
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
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4469.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62407de-b62b-4b83-4e73-08dde0744d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 05:33:47.3533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5Qys2uB7KGjcIEziK00ILXG5ex6lrhj0uAVZCcRgOi+6drZ/DmOv5QSBAmkM9B4r0A9TXCa8w0R9XkDsQFRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR15MB6092
X-Proofpoint-GUID: xdVdx6b3yt4_iLn4KjrRO4YlyFShyv1u
X-Authority-Analysis: v=2.4 cv=IrhHsL/g c=1 sm=1 tr=0 ts=68a6afbe cx=c_pps
 a=6lib/t1tMPUsg/VFQO8C4g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NEAV23lmAAAA:8 a=hwW9ofN5u82dzU0bgk0A:9 a=wPNLvfGTeEIA:10 a=7jBqKnKQzRwA:10
 a=1urcsAcQ4Z0A:10 a=tgtgJ2ir1Bd-oDNDnLMA:9 a=c5sJwLyTszVa8eV_:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDIyMiBTYWx0ZWRfXy8wNKq6D/3uR
 JTmA6S4qQ6w5Ug9UnkJEo3rj8SfvpO5hn+qAzozRtUFxKcSxVM/OVTv/xcp8ppaRNE1COuFYdzE
 08RfaBTlf5yLuOX+A94rvuH2p6kDGbrpZvZWrb2pD9hQc7R9DevtY2xU/b742gdshTMq2Gtt9r0
 JFHlnyvztD4vy9rx+h4QaV/0CKxaQ+jCrDDOJ2pyRkpuxlNZMF+6VWZ4VDm65evUuSjjeqIoWsp
 x36pz/9PlLCvw2xG97F0JUjj911uHmEVfGLda8xgKNYbVweMKaF2sKDdTSyiKbdzBas4b2hGRc5
 zfww0ZeAoDGsHYUcXkTq8ovURF1EolvUUqxbourdQDIbFSLoh5Mvsfpm9HMLl9LFIBVsk5kRjiR
 eHKB6VLQ/qyhdC94x/XLTo/0wECXzQ==
X-Proofpoint-ORIG-GUID: xdVdx6b3yt4_iLn4KjrRO4YlyFShyv1u
Subject: RE: TOF elections for 2025H2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190222
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_SJ0PR15MB446982270CCD58376C6A8BF1FA32ASJ0PR15MB4469namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I nominate Manoj


________________________________
From: Patrick Williams
Sent: Wednesday, August 20, 2025 02:09
To: OpenBMC List
Subject: [EXTERNAL] Re: TOF elections for 2025H2

On Mon, Aug 18, 2025 at 04:18:29PM -0400, Patrick Williams wrote:
>     https://github.com/openbmc/tof-election/tree/main/2025H1

Rohit mentioned that I had the wrong link.  Please use this one for the
current eligible developers:

    https://github.com/openbmc/tof-election/tree/main/2025H2

--
Patrick Williams

--_000_SJ0PR15MB446982270CCD58376C6A8BF1FA32ASJ0PR15MB4469namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I nominate Manoj</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Patrick Williams<br>
<b>Sent:</b>&nbsp;Wednesday, August 20, 2025 02:09<br>
<b>To:</b>&nbsp;OpenBMC List<br>
<b>Subject:</b>&nbsp;[EXTERNAL] Re: TOF elections for 2025H2 </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Mon, Aug 18, 2025 at 04:18:29PM -0400, P=
atrick Williams wrote:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" rel=3D"noopener=
 noreferrer" class=3D"OWAAutoLink" id=3D"OWAc7e9f1dc-d022-9f0a-5f5c-a04f15c=
458ee" target=3D"_blank" href=3D"https://github.com/openbmc/tof-election/tr=
ee/main/2025H1">
https://github.com/openbmc/tof-election/tree/main/2025H1</a><br>
<br>
Rohit mentioned that I had the wrong link.&nbsp; Please use this one for th=
e<br>
current eligible developers:<br>
<br>
&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" rel=3D"noopener noreferre=
r" class=3D"OWAAutoLink" id=3D"OWA137be655-b26e-713c-5ac3-c20e56e5ad70" tar=
get=3D"_blank" href=3D"https://github.com/openbmc/tof-election/tree/main/20=
25H2">
https://github.com/openbmc/tof-election/tree/main/2025H2</a><br>
<br>
--<br>
Patrick Williams<br>
</div>
</body>
</html>

--_000_SJ0PR15MB446982270CCD58376C6A8BF1FA32ASJ0PR15MB4469namp_--

