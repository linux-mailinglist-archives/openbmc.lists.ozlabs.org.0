Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE83C14BDAE
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 17:27:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486X8h32TmzDqL5
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 03:27:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486X7z0j2WzDqKZ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 03:27:10 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SGNTmX078434
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:27:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrj72pytx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:27:07 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00SGNTQ4078451
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:27:05 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrj72pyqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 11:27:05 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00SGP224012102;
 Tue, 28 Jan 2020 16:27:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 2xrda6sf9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 16:27:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00SGR0g037093658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jan 2020 16:27:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2485AC059;
 Tue, 28 Jan 2020 16:27:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20C0BAC05B;
 Tue, 28 Jan 2020 16:26:59 +0000 (GMT)
Received: from [9.102.33.12] (unknown [9.102.33.12])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jan 2020 16:26:58 +0000 (GMT)
Subject: Re: Farewell & Best Wishes
To: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <eb25580d-ca7e-6b2c-1171-3193e87544a0@linux.vnet.ibm.com>
Date: Tue, 28 Jan 2020 10:26:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E5B68F1F6DC471CDD0F38BDF"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_05:2020-01-28,
 2020-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001280126
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
--------------E5B68F1F6DC471CDD0F38BDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/2020 8:37 PM, Emily Shaffer wrote:
> All,
>
> While I've very much enjoyed my time working with this community, it's 
> time for me to step down as comaintainer on the various IPMI projects. 
> I'll be fully devoting my time to hacking Git, these days. :)
>
> Sometime this week I'll be sending changes to remove me from the 
> appropriate MAINTAINERS files. If there is something that you still 
> need from me - a review, an opinion, whatever - please let me know and 
> I can take care of it. I'll continue to peek into my review queue this 
> week and next week; after that, I won't be gone forever, but I won't 
> be able to grant approvals on Gerrit.
>
> I expect I'll still be reachable all the usual ways - this email, 
> Freenode, LinkedIn, whatever - I won't be disappearing or changing 
> employers, just focusing my time elsewhere.
>
> Thank you all very much for the extraordinary learning experience I've 
> had working with this project and incredible group of people. I wish 
> everyone success in the future and look forward to OpenBMC as the norm 
> in datacenters and home workstations.
>
Great working with you Emily!
Thanks for all your work and leadership on the project!
Don't be a stranger. :)

Gunnar

>
> Yours,
> Emily

--------------E5B68F1F6DC471CDD0F38BDF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/2020 8:37 PM, Emily Shaffer
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">All,
        <div><br>
        </div>
        <div>While I've very much enjoyed my time working with this
          community, it's time for me to step down as comaintainer on
          the various IPMI projects. I'll be fully devoting my time to
          hacking Git, these days. :)<br>
          <br>
          Sometime this week I'll be sending changes to remove me from
          the appropriate MAINTAINERS files. If there is something that
          you still need from me - a review, an opinion, whatever -
          please let me know and I can take care of it. I'll continue to
          peek into my review queue this week and next week; after that,
          I won't be gone forever, but I won't be able to grant
          approvals on Gerrit.</div>
        <div><br>
        </div>
        <div>I expect I'll still be reachable all the usual ways - this
          email, Freenode, LinkedIn, whatever - I won't be disappearing
          or changing employers, just focusing my time elsewhere.</div>
        <div><br>
        </div>
        <div>Thank you all very much for the extraordinary learning
          experience I've had working with this project and incredible
          group of people. I wish everyone success in the future and
          look forward to OpenBMC as the norm in datacenters and home
          workstations.<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p>Great working with you Emily! <br>
      Thanks for all your work and leadership on the project!<br>
      Don't be a stranger. :) <br>
      <br>
      Gunnar<br>
    </p>
    <blockquote type="cite"
cite="mid:CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Yours,<br clear="all">
          <div>
            <div dir="ltr" class="gmail_signature"
              data-smartmail="gmail_signature">Emily</div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------E5B68F1F6DC471CDD0F38BDF--

