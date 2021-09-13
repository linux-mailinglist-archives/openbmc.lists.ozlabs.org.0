Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1E40A1A5
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 01:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7jdz2bTlz2yJs
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 09:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=YW77MzKa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=0890eef75f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=YW77MzKa; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7jdS63L7z2yHP
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 09:40:11 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DKiYcU010237; 
 Mon, 13 Sep 2021 23:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=x3IktYKlrF8Yjs4OXRZUVWcPPJo+MtTx7V3LCBbQZLM=;
 b=YW77MzKa9Qf6m43E11iZ2qZo5CMGJ6pxZTxWXZDrm7rreopbhvMOboUL/d1U/5k4ZtZT
 LmBurIoAFo9DjIYMC6L9Ah5bDBAnet5KOtOvyXpmi/umC8Tx25N5m5LQQOqvuiU17FEe
 TcWJFbAHKmCrBrrHocEC+sgbwCbQ7rdEe1qmpHexpWYok+6OSHlYdCiYxhmOtsmQLL5w
 /36hd/5X4M0+KZtq9TSe1BjOG9EyoIy3dJc2GfSO2YdjpF9y0QPxWyshec/tWrtmdO/X
 NLQ693ko6hUueo3tcUmjwT7f3aQ9C4b9Mz/41T/domLL2kpl+/ttO88VSj3EL1Q2jSvV ug== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-00268f01.pphosted.com with ESMTP id 3b2dxbrecq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 23:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myF3rfmQzj/Ub9GNBbcAbG1fSk+HE/ocwD+3ujLFEueuBW7SdOjeKUuPycYl3TurL7PFtlBn7xQoH0fzGhHvMxZzUPKaDb341xEu1J+9jPyK5t+frZhxDZDH6IbS+k/WrTAKUUkbvRUwsvScLJXAnPjCM0Ib9UOcxDCI1kn62KT0ICv6TSwykJ4JKYi0J763gc7ANeDIZWV0nOw5sCaml/hF8qktZxfpjNYDVEf18SKyyYOBdKNiaWJMr0388Ilu/WhEUtPdcjhUAJjKhA4rlDCh9+AvpsQL+3G6yxJ0rkphzp9toFhZ7uc3kD6TN+77ov63/KDpaQCt+zebwC/2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=x3IktYKlrF8Yjs4OXRZUVWcPPJo+MtTx7V3LCBbQZLM=;
 b=HpPcX3u3UWLO3qTgvqMJmsPOaJFT5ya0T7J8Y30BVTtep/nYqN4jl7fgSk/06hPIsaj1NOkD1RzONVLXlvL5Zm1BBPkeQr6We34kkdF2q8p64XacqV1XmTV+Ua4Wid6kjhImqKZ2XIAE7Mbu9Nt7y/wcYNoVMDyTKmQQO6OhMGLdW0VA+dkMvH9/bhLrEo7Kt/nSnYUhDwk35YoXSN6v9Uldc6J+CsskCYA3uv6ENuEDD99KKZC14JhUm21v1dSy6XlRZEhqwbkwSOOTgUJTCZZD3PrZcGzhpcCQeQmakWRqZ6XpjM6BBJzSNGGbGPpW3RARoj3fNWDmGfskZQ9zrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7797.namprd04.prod.outlook.com (2603:10b6:8:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 23:40:05 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 23:40:04 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Graeme Gregory <quic_ggregory@quicinc.com>
Subject: Re: CCLA for Qualcomm Inovation Center Inc.
Thread-Topic: CCLA for Qualcomm Inovation Center Inc.
Thread-Index: AQHXqPitk46t4by+a0+o0sj7V1HrKQ==
Date: Mon, 13 Sep 2021 23:40:04 +0000
Message-ID: <20210913234003.GK17315@packtop>
References: <bcca2ce7-23ab-c76f-f78e-c3a133396254@quicinc.com>
In-Reply-To: <bcca2ce7-23ab-c76f-f78e-c3a133396254@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a00f99af-e2a5-4a9b-470e-08d9770fcffc
x-ms-traffictypediagnostic: DM8PR04MB7797:
x-microsoft-antispam-prvs: <DM8PR04MB77978CECD5760D11E5B19A9EC3D99@DM8PR04MB7797.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AdkSrM/Ox4YX1M3RAScGlpqcYoYQ4fnuTPsPRmZOShw4JnRnUVPRxn6cU0sHDyaR6dlMOGu+LxVanT5CxhaoK+gjN2i4KsI1GZDmMlj8TUs7HVsy3vUREvGgk97nuE26I0R3a8n09lQU1lx2rVPqueLl4Rafr6OKvPoxKMXp37fIUa3VFyaAiMm//PYY8YpcfFS8XLL75FHGsSkD6ywEuskZ+M/HJlc+IdK/puDgzAt/MRfNC152nk+JKXwSsRlqWDy0U3A7ukXjjosdolC7OGtAmD1LgMrRFFJP/cubm9q7u00IN7BBwVyVAwunfj3VWodmMt+gbSBL5ir1X3vRVB4eHTRBleYwRSojO/4fEniiUs168Vq9023i/VCmuvm8HAcjyUGLxMQ++8GzjlIpI3zFJRM3lMfEl2yHcBkctBEQZLb+UUJB/Fw6AVtp+mHmZ4Ni75+NXnMWEE6eO3xkT01PC2qYqUbJxQhm+HHFxYa7i9k75+EKC8FDuaGDaoS9kHbnm5iVwpTD6XZdqvnDVB/6/gzRJhjqQcdFPiJAwd/yPLWt0HHXV5xKtswaNlbAID397nxsqQ7VF91XXjDwWT1LfOm/FLJqQaqdMYxmzwFBfODfyHawXZnsErrXl70e9h5aWYVlwed78UOv0177VRM9iE7WYP8EOagAaoxY0FlfNf810WKfSmSkdSEbyAwQkLoqhHA+3Mt62EtvDECMjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(39860400002)(376002)(396003)(346002)(366004)(76116006)(91956017)(478600001)(122000001)(66946007)(38070700005)(33716001)(6916009)(2906002)(86362001)(33656002)(316002)(38100700002)(6486002)(4326008)(186003)(9686003)(6512007)(558084003)(1076003)(64756008)(66556008)(66476007)(66446008)(8676002)(71200400001)(6506007)(8936002)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V1VflKOsoLQvkawy9tT0e3os3vqx1lIdPGyPFrwJTu6FCbec49h13cy5WMwV?=
 =?us-ascii?Q?0Kj5xpGwPqCOaaGO6/qotNL2lFEUQE0IaT6M0VigOgHQ3fkW8tPFc87mRvil?=
 =?us-ascii?Q?d9RWur/GmU330ATjJDgspwUwvFWJiq4CjmXUw2dSLhmhenbhbPS9vUzi8R/s?=
 =?us-ascii?Q?f9lkuvcCTMX3wk1jQBrqSraV9so/eQjrBrMTcVJKUCkC76aSLZaUs/HDq4Vh?=
 =?us-ascii?Q?XE2xlUEJxJ0/rdo5EiUbakdggyJ37sVqkqkrXljCAe4EGBvIpMX9/zuIqnGz?=
 =?us-ascii?Q?P8WArhhwK2Kfj5OiYoCaZQnK3Nsm1aCyXIZ4+5pPofei5/F9k0HIocEaPP/I?=
 =?us-ascii?Q?MvVAeevT8PnCf6uk6jB8ndxCNl0+wDBwvWPcXBqI8iK36U76sQlJMA50HBO5?=
 =?us-ascii?Q?gyNiBWlTFRMiO1yUnYM360g5PpSsMqlaatagevYTdzLTkG0wpINXuLHvdvpG?=
 =?us-ascii?Q?WwRSk0nXITqEAZRlbOtlzvKIrmah9oleeRwxet2imnHoHkwaOcCHeSuCeW+T?=
 =?us-ascii?Q?64e6omj1lJH0c616hPogu8SsIyFBnjoztlZbrzD85b1MeoPdMlaEhMnhorUp?=
 =?us-ascii?Q?A26XUIg9x+PKyExl+75/VKYPuiO1J8tdaIP/Ht1spIsEOBPjhdAJ0IpxDWeT?=
 =?us-ascii?Q?Rss85eaPu/W1JfgUqNAe8RmG7sEZrtP4xSg6WE+kOmQ4SYcDXj5uwenUuaB0?=
 =?us-ascii?Q?LjOtMfyeQvQN2ttfsmtCygeRbGBAht/sSrrxCjNvpoXcKs9WWEw+BBFpOnAT?=
 =?us-ascii?Q?fbDyBFke08Ecfn5drvtjYP1k1Tk5J4kmQcYgv5S1bmDwAw0kehmRp1fiig3L?=
 =?us-ascii?Q?T12HeC2eUw3eJeiLSTFDcG/irHw/beowubmBZK/+sZh+MjCsNhUI/0CooSqa?=
 =?us-ascii?Q?F9SFUjgI/wUvAQ03Yy8yvaXIFFvX076VNoUzX+cswUUyfYU2sbCvmZ/a5lza?=
 =?us-ascii?Q?DD4ij07sPn6E96CYAnkRQoAWcLUL3v5RqPlOl5O2DjeJ1MIZFkesBH7U202i?=
 =?us-ascii?Q?8DFxuw6hSzqW9llsYx/ntAcDnjcAmYPQCya2kYZLq2yQtbAxg+6RtlDZm45A?=
 =?us-ascii?Q?cvLDT4cb0JX/81t2QWFYm0tZlMmoVyrCS2CHQU7WKoo18rzMQX2zF0eRTuwt?=
 =?us-ascii?Q?lQD3NozzTMOdOtVSHJ75vJVyM5JOwFMdSJUoDLMrrH4U/mBn8M9zm4PiJBWq?=
 =?us-ascii?Q?bgn1zVkvLrNbKoCBxlRnhOIk+0CRbCzqJv6i5P6btyqJR8Oii1xh2qhVpGv/?=
 =?us-ascii?Q?pqg7oN9lxs5yBPBdpXQ0D8BxkqKI71F/XBZcIUvx5CmkmTMEfpOEyQzf5LZv?=
 =?us-ascii?Q?nakPS4UPImQDnWe+/9fezZFo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <194EF4EBDF39B24DA072D66C57B61F9C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00f99af-e2a5-4a9b-470e-08d9770fcffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 23:40:04.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AM6cfZ10qnCq40s5IIk4P7kry/3stsDX8zTNg3+uy/HKfwGuZMzJ1Wz+BmOuMKqZroMwgQmoPIIcDWibV5FaiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7797
X-Proofpoint-GUID: VstBinw9dkg4SvRfIRJIcdCywqJT2lnk
X-Proofpoint-ORIG-GUID: VstBinw9dkg4SvRfIRJIcdCywqJT2lnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=821 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130137
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

I'm not involved with the CLA process, but FWIW it looks like there's a
typo (missing 'r') in your email address on page 1.


Zev

On Mon, Sep 13, 2021 at 09:12:01AM PDT, Graeme Gregory wrote:
>Please find our CCLA attached for the OpenBMC project.
>
>Thanks
>
>Graeme
>

