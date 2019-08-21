Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 836BC98907
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 03:35:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DRtg71FrzDr1C
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 11:35:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.133.20; helo=mx0a-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="GECCM7d2"; 
 dkim-atps=neutral
X-Greylist: delayed 11321 seconds by postgrey-1.36 at bilbo;
 Thu, 22 Aug 2019 11:34:51 AEST
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DRsl1KqJzDr0m
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 11:34:48 +1000 (AEST)
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LMOfn0007964
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Nr3iT9Z7KWJvzLnnL1cFb/EL8OjgP9yqRm8/mCao5PY=;
 b=GECCM7d2WpIvjeEIEA+7gEWTYM9iM2oYUVVSFRlooxKoD/IpaiyvIz9dHX+ZBnwYty5i
 g7scqzouyJFwfL+J55AwSvrYCjidzCFK+dAI1Atz3BSHZhU+NPut72tYDBl2ywwRjivi
 cjlSGvXAbUogytaSFIu0y+kXxoJ+hAOfUkbuG8062pGNxs1SO3XH8PZcLsdma/ynHCCp
 tQnknJWdgY/KMHPIuM9ZBMM62CjILehGmVeLEbaeq/XXGHE0NHM7xqweYswza9G0KO44
 E8QvdQX3oZ9E3VmCPCuHpQ1K9n+aV/iTMfajTHgIiAju56chAr//3A4jzNbocZO9tl7i UA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 2uh2kxbhrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:26:01 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LMN3ik195682
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:26:01 -0400
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
 [143.166.85.207])
 by mx0a-00154901.pphosted.com with ESMTP id 2uhdu6rrwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:26:00 -0400
X-LoopCount0: from 10.166.135.98
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,346,1549951200"; d="scan'208";a="1288232703"
From: <Justin.Lee1@Dell.com>
To: <benwei@fb.com>, <sam@mendozajonas.com>, <davem@davemloft.net>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next] net/ncsi: update response packet length for
 GCPS/GNS/GNPTS commands
Thread-Topic: [PATCH net-next] net/ncsi: update response packet length for
 GCPS/GNS/GNPTS commands
Thread-Index: AdVYbQEZzjCYid+VRb6aZg2XXHH58AAAP+qQ
Date: Wed, 21 Aug 2019 22:25:58 +0000
Message-ID: <75471e1fa4de4ac4b5e254827930e0e2@AUSX13MPS302.AMER.DELL.COM>
References: <CH2PR15MB3686567EBCBE71B41C5F079AA3AA0@CH2PR15MB3686.namprd15.prod.outlook.com>
In-Reply-To: <CH2PR15MB3686567EBCBE71B41C5F079AA3AA0@CH2PR15MB3686.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-21T22:25:57.4059850Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210220
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210220
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

Hi Ben,

Those are correct adjustment and I had tested previously.=20

Thanks,
Justin


Reviewed-by: Justin Lee <justin.lee1@dell.com>


> Update response packet length for the following commands per NC-SI spec
> - Get Controller Packet Statistics
> - Get NC-SI Statistics
> - Get NC-SI Pass-through Statistics command
>=20
> Signed-off-by: Ben Wei <benwei@fb.com>
> ---
>  net/ncsi/ncsi-rsp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c index 7581bf919885=
..5254004f2b42 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -1083,9 +1083,9 @@ static struct ncsi_rsp_handler {
>  	{ NCSI_PKT_RSP_GVI,    40, ncsi_rsp_handler_gvi     },
>  	{ NCSI_PKT_RSP_GC,     32, ncsi_rsp_handler_gc      },
>  	{ NCSI_PKT_RSP_GP,     -1, ncsi_rsp_handler_gp      },
> -	{ NCSI_PKT_RSP_GCPS,  172, ncsi_rsp_handler_gcps    },
> -	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
> -	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
> +	{ NCSI_PKT_RSP_GCPS,  204, ncsi_rsp_handler_gcps    },
> +	{ NCSI_PKT_RSP_GNS,    32, ncsi_rsp_handler_gns     },
> +	{ NCSI_PKT_RSP_GNPTS,  48, ncsi_rsp_handler_gnpts   },
>  	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
>  	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
>  	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
> --
> 2.17.1

