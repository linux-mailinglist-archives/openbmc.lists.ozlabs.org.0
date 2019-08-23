Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B40E39B377
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 17:36:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FQVH5BBtzDrqN
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 01:36:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FQRJ0zKtzDrqF
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 01:33:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7NFQXPW120562
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 11:33:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ujhgsbu5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 11:33:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7NFXRO6139381
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 11:33:42 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ujhgsbu5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 11:33:42 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7NFV2nc014914;
 Fri, 23 Aug 2019 15:33:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2uj2eydyax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 15:33:42 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7NFXfAL52560182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 15:33:41 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4355F2805C;
 Fri, 23 Aug 2019 15:33:41 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E076628058;
 Fri, 23 Aug 2019 15:33:39 +0000 (GMT)
Received: from [9.81.210.193] (unknown [9.81.210.193])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 23 Aug 2019 15:33:39 +0000 (GMT)
Subject: Re: OpenBMC Hackathon will be at OSFC Sept 2019
To: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <aaba7044-b4fd-4906-ff11-74227eaf7d77@linux.vnet.ibm.com>
Date: Fri, 23 Aug 2019 10:33:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DAF6212B9D8087397E940C09"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=889 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230158
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

This is a multi-part message in MIME format.
--------------DAF6212B9D8087397E940C09
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/20/2019 10:34 AM, Nancy Yuen wrote:
> OpenBMC will hold a Hackathon as part of the Open Source Firmware 
> Conference <https://osfc.io/> (OSFC) in September.  OpenBMC will have 
> it's own track there.
>
> *Location*
> Presentations Sept 3-4 @ Google in Sunnyvale
> Google Building MP1
> 1155 Borregas Ave
> Sunnyvale, CA, 94089
> USA
>
> Hacking Sept 5-6 @ Facebook in
> Facebook Building MPK60
> 150 Independence Dr
> Menlo Park, CA, 94025
> USA
>
Hi Nancy,

What is the format of the hacking part of the OSFC? Do we have a list of 
ideas?

--------------DAF6212B9D8087397E940C09
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/20/2019 10:34 AM, Nancy Yuen
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADfYTpEGPt5Bo+X689iaaFm5zWsx4CZrtj9yuNiedw5X5Orejw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">OpenBMC will hold a Hackathon as part of the <a
            href="https://osfc.io/" moz-do-not-send="true">Open Source
            Firmware Conference</a> (OSFC) in September.  OpenBMC will
          have it's own track there.</div>
        <div><br>
        </div>
        <div dir="ltr">
          <div dir="auto"><b>Location</b></div>
          <div dir="auto">Presentations Sept 3-4 @ Google in Sunnyvale</div>
          <div dir="auto">Google Building MP1<br>
            1155 Borregas Ave <br>
            Sunnyvale, CA, 94089 <br>
            USA<br>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Hacking Sept 5-6 @ Facebook in </div>
          <div dir="auto">Facebook Building MPK60<br>
            150 Independence Dr <br>
            Menlo Park, CA, 94025 <br>
            USA</div>
        </div>
        <div dir="ltr"><br>
        </div>
      </div>
    </blockquote>
    Hi Nancy,<br>
    <br>
    What is the format of the hacking part of the OSFC? Do we have a
    list of ideas?<br>
  </body>
</html>

--------------DAF6212B9D8087397E940C09--

