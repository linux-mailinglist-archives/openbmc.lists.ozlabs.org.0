Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B4811D102
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 16:29:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yd4S1Td8zDqnZ
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 02:28:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YctJ5BfqzDr31
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 02:20:07 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCFIqSL138004
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 10:20:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wu1fnmx32-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 10:20:02 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 12 Dec 2019 15:20:00 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Dec 2019 15:19:58 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCFJuuO21561518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 15:19:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF9974C05A;
 Thu, 12 Dec 2019 15:19:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5241D4C06E;
 Thu, 12 Dec 2019 15:19:55 +0000 (GMT)
Received: from [9.102.55.212] (unknown [9.102.55.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Dec 2019 15:19:54 +0000 (GMT)
Subject: Re: SLPD multicast support
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 tyler.sabdon@gmail.com
References: <CAO9PYRL-M2ZjPr6R+V+isDiFttkpbp2hWNHQVsPxFOV6G+mtOA@mail.gmail.com>
 <bdb246cb-d27d-8a0a-8924-46b8838df46e@linux.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 12 Dec 2019 20:49:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <bdb246cb-d27d-8a0a-8924-46b8838df46e@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------86E93111EDBAEC1DB14FE09F"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19121215-0012-0000-0000-000003742BD6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121215-0013-0000-0000-000021B00860
Message-Id: <5155704f-99e8-2099-5f74-210b85f4ce19@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_03:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=998 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912120118
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
--------------86E93111EDBAEC1DB14FE09F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Deng,

Yes, Currently openbmc support SLP unicast not multicast.
eg: SLP command for unicast.
slptool -u ${ip} findsrvtypes or findsrvs
If you are really looking for the service discovery, OpenBMC supports Avahi.
eg: avahi-browse -rt _obmc_rest._tcp

Ratan

On 12/12/2019 1:44 AM, Joseph Reynolds wrote:
> On 12/11/19 6:31 AM, Deng Tyler wrote:
>> Hi All:
>>     I have a management tool to discovery service in a subnet by slp 
>> multicast. But I can't find any openbmc server. I check 
>> https://github.com/openbmc/slpd-lite and find that slpd-lite didn't 
>> support multicast but unicast. I am confused that how to leverage 
>> unicast slp in openbmc? What is the service name in openbmc? Could 
>> someone example a slp usage scenario in openbmc? thanks.
>
> I understand OpenBMC implements Avahi Zeroconf DNS service discovery. 
> There is a doc review for it here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23484
>
> The review points to the implementation which is already merged into 
> the project.
>
> - Joseph
>
>>
>> Tyler
>

--------------86E93111EDBAEC1DB14FE09F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Deng,</p>
    Yes, Currently openbmc support SLP unicast not multicast.<br>
    eg: SLP command for unicast.<br>
    <span style="color: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(248, 248, 248); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">slptool -u ${ip} findsrvtypes or findsrvs
</span><br>
    If you are really looking for the service discovery, OpenBMC
    supports Avahi.<br>
    eg: avahi-browse -rt _obmc_rest._tcp
    <p>Ratan</p>
    <div class="moz-cite-prefix">On 12/12/2019 1:44 AM, Joseph Reynolds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bdb246cb-d27d-8a0a-8924-46b8838df46e@linux.ibm.com">On
      12/11/19 6:31 AM, Deng Tyler wrote:
      <br>
      <blockquote type="cite">Hi All:
        <br>
            I have a management tool to discovery service in a subnet by
        slp multicast. But I can't find any openbmc server. I check
        <a class="moz-txt-link-freetext" href="https://github.com/openbmc/slpd-lite">https://github.com/openbmc/slpd-lite</a> and find that slpd-lite
        didn't support multicast but unicast. I am confused that how to
        leverage unicast slp in openbmc? What is the service name in
        openbmc? Could someone example a slp usage scenario in openbmc?
        thanks.
        <br>
      </blockquote>
      <br>
      I understand OpenBMC implements Avahi Zeroconf DNS service
      discovery. There is a doc review for it here:
      <br>
      <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23484">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23484</a>
      <br>
      <br>
      The review points to the implementation which is already merged
      into the project.
      <br>
      <br>
      - Joseph
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Tyler
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------86E93111EDBAEC1DB14FE09F--

