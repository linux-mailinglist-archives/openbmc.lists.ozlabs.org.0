Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57DB7E68
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:41:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1KX6y0WzF55L
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:41:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0165333305=bruno.cornec@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 2500 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Sep 2019 01:25:19 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z0z32njVzF4pZ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:25:17 +1000 (AEST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JEfDWD007393; Thu, 19 Sep 2019 14:43:29 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 2v3vapr4ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 14:43:29 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
 [16.196.225.135])
 by g2t2352.austin.hpe.com (Postfix) with ESMTP id F143685;
 Thu, 19 Sep 2019 14:43:28 +0000 (UTC)
Received: from morley.fr.hpecorp.net (morley.fr.hpecorp.net [10.39.8.55])
 by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id A862F37;
 Thu, 19 Sep 2019 14:43:28 +0000 (UTC)
Received: by morley.fr.hpecorp.net (Postfix, from userid 2000)
 id ECF24117B; Thu, 19 Sep 2019 16:43:27 +0200 (CEST)
Date: Thu, 19 Sep 2019 16:43:27 +0200
From: Bruno Cornec <Bruno.Cornec@hpe.com>
To: Nancy Yuen <yuenn@google.com>
Subject: Re: Redfish workshop in France 10/31
Message-ID: <20190919144327.GK5768@morley.fr.hpecorp.net>
References: <CADfYTpGtEP9_ewuK=DufvkWDmfO1gpyQnvPbC5vy9-+b4p=Hhg@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
In-Reply-To: <CADfYTpGtEP9_ewuK=DufvkWDmfO1gpyQnvPbC5vy9-+b4p=Hhg@mail.gmail.com>
X-Humor: Linux is to Windows what early music is to military music
X-Operating-System: Linux morley.fr.hpecorp.net 4.9.50-server-1.mga6
X-Current-Uptime: 18:12:12 up 3 min, 10 users, load average: 8, 87, 4, 50, 1,
 75
X-HP-HOWTO-URL: http://www.HyPer-Linux.org/HP-HOWTO/current
X-URL: http://http://eurolinux.fr.smktg.hpecorp.net/
X-eurolinux: ftp://eurolinux.fr.smktg.hpecorp.net/pub/linux
X-mondorescue: http://www.mondorescue.org ftp://ftp.mondorescue.org
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_05:2019-09-19,2019-09-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909190139
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Thanks Nancy for announcing the workshop ! 
And for this community, if you want to contribute to the workshop to present OpenBMC's Redfish implementation, feel free to contact me directly.

Best regards,
Bruno.

Nancy Yuen said on Wed, Sep 04, 2019 at 11:19:38AM -0700:

>Free event, colocated with Open Source Summit Europe (search Redfish
>Workshop in the page):
>https://events.linuxfoundation.org/events/open-source-summit-europe-2019/program/co-located-events/
>
>and here: http://trac.project-builder.org/wiki/RedfishWSEurope2019
>
>Registration required:
>https://framaforms.org/redfish-workshop-oss-europe-2019-registration-form-1567095132
>----------
>Nancy

-- 
HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensource
Open Source Profession, WW Linux Community Lead    http://github.com/bcornec
FLOSS projects:     http://mondorescue.org        http://project-builder.org
Musique ancienne?   http://www.musique-ancienne.org  http://www.medieval.org
