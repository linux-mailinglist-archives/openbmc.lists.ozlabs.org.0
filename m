Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ECC1BE4A8
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 19:03:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C4bB5LdWzDr8p
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 03:03:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C4Xh1RhgzDr7f
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 03:01:06 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TGXqE6036217; Wed, 29 Apr 2020 13:01:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhfpe6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 13:01:00 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03TGxsxQ112551;
 Wed, 29 Apr 2020 13:01:00 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhfpe5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 13:00:59 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03TGw1Oa000812;
 Wed, 29 Apr 2020 17:00:58 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 30mcu6pdfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 17:00:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03TH0viV49807692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 17:00:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9048BE053;
 Wed, 29 Apr 2020 17:00:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10037BE051;
 Wed, 29 Apr 2020 17:00:54 +0000 (GMT)
Received: from [9.102.37.152] (unknown [9.102.37.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 17:00:54 +0000 (GMT)
Subject: Re: OpenBMC 2.8 Release
To: Kurt Taylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, joel@jms.id.au,
 dkodihal@linux.vnet.ibm.com
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
Date: Wed, 29 Apr 2020 12:00:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------2FEDC7F97C4FC1774EA376B4"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_08:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290130
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
--------------2FEDC7F97C4FC1774EA376B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/2020 10:48 AM, Kurt Taylor wrote:
> just add it directly here:
> https://github.com/openbmc/openbmc/wiki/Current-Release-Content

Added:

  * Yocto refresh to "Dunfell" version 3.1
  * Redfish support for: full certificate management, complete LDAP
    management, full sensor support, event service schema, task schema
  * Move to Redfish Specification 1.9.0
  * Redfish support for 2019.4 Schemas
  * GUI enhancements: LDAP, certificate management


And removed "|Redfish configuration backup and restore function|".
James, Jason are you okay with the Redfish list above?Should we add 
something about Storage & Drives? Anything else?

Should we add something about the Kernel? "Move to 5.4"?

Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM 
Support" and "Partial MCTP Support".

https://github.com/openbmc/docs/blob/master/release/release-notes.md

--------------2FEDC7F97C4FC1774EA376B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 4/29/2020 10:48 AM, Kurt Taylor
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">just add it directly here:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/wiki/Current-Release-Content">https://github.com/openbmc/openbmc/wiki/Current-Release-Content</a></pre>
    </blockquote>
    <br>
    <tt>Added:</tt><tt><br>
    </tt><tt>
    </tt>
    <ul>
      <li><font size="-1">Yocto refresh to "Dunfell" version 3.1</font></li>
      <li><font size="-1">Redfish support for: full certificate
          management, complete LDAP management, full sensor support,
          event service schema, task schema</font></li>
      <li><font size="-1">Move to Redfish Specification 1.9.0</font></li>
      <li><font size="-1">Redfish support for 2019.4 Schemas</font></li>
      <li><font size="-1">GUI enhancements: LDAP, certificate management</font></li>
    </ul>
    <tt><br>
    </tt><tt>And removed "</tt><code data-stringify-type="code"
      class="c-mrkdwn__code">Redfish configuration backup and restore
      function</code><tt>".</tt><br>
    <tt>James, Jason are you okay with the Redfish list above?</tt><tt>
      Should we add something about Storage &amp; Drives? Anything else?<br>
    </tt><br>
    <tt>Should we add something about the Kernel? "Move to 5.4"?<br>
    </tt><br>
    <tt>Anything for PLDM / MCTP? For the 2.7 release it says "Partial
      PLDM Support" and "Partial MCTP Support".</tt><br>
    <br>
    <tt><a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/release/release-notes.md">https://github.com/openbmc/docs/blob/master/release/release-notes.md</a></tt>
  </body>
</html>

--------------2FEDC7F97C4FC1774EA376B4--

