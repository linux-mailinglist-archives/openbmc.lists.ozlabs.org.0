Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF241F7A77
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 17:12:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k4325NV7zDqwN
	for <lists+openbmc@lfdr.de>; Sat, 13 Jun 2020 01:12:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k4200V91zDqvl
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jun 2020 01:11:34 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CF3l2n030923; Fri, 12 Jun 2020 11:11:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m6gf42xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 11:11:30 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05CF4DPE033757;
 Fri, 12 Jun 2020 11:11:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31m6gf42vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 11:11:29 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05CF1GGJ018256;
 Fri, 12 Jun 2020 15:11:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 31g2s83jb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 15:11:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05CFA7qq62587184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 15:10:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D83EF42041;
 Fri, 12 Jun 2020 15:11:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696BF42047;
 Fri, 12 Jun 2020 15:11:22 +0000 (GMT)
Received: from [9.79.179.212] (unknown [9.79.179.212])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Jun 2020 15:11:22 +0000 (GMT)
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: Re: OpenBMC 2.8 Release
To: openbmc@lists.ozlabs.org, wak@google.com
References: <OF1080F77B.8EF587E4-ON0025857E.003665AE-6525857E.00366D57@LocalDomain>
 <OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@notes.na.collabserv.com>
Message-ID: <5b3a91d9-531d-974a-fc39-489983dc22c4@linux.vnet.ibm.com>
Date: Fri, 12 Jun 2020 20:41:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------99889758AC187E1B1B06EE27"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 cotscore=-2147483648 mlxscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: Prashanth Katti1 <prkatti1@in.ibm.com>, krtaylor <kurt.r.taylor@gmail.com>,
 "Mauery, Vernon" <vernon.mauery@intel.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------99889758AC187E1B1B06EE27
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hello William,

https://github.com/openbmc/phosphor-net-ipmid/issues/12

This issue got reported on openbmc master which is needed for OpenBMC 
2.8 release. The VLAN creation is failing via IPMI and the trace 
indicates the failure to delete the non static address.
This had worked on the earlier 2.7 community release. I have not 
followed much the changes on the phosphor-networkd front.
Since you had helped rewrite the transport handler. Can you help comment 
on the issue?

Copying Johnathan, do you run into this on your platforms?

Regards,
Tom

On 05-06-2020 15:53, Prashanth Katti1 wrote:
> Hi All,
> We tested Firmware version : 2.8.0-rc1-0-g35a774200 on Witherspoon, 
> and found following issues.
>
> DHCP            - https://github.com/openbmc/bmcweb/issues/127
> LDAP             - 
> https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html
> VLAN via REST - https://github.com/openbmc/openbmc/issues/3668
> VLAN via IPMI     - 
> https://github.com/openbmc/phosphor-net-ipmid/issues/12
>
> Rest of the functionalities looks good and are stable in our testing.
> Hope this input helps.
>
> Prashanth Katti
>
>
>
>
> From: krtaylor <kurt.r.taylor@gmail.com>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 03-06-2020 00:46
> Subject: [EXTERNAL] Re: OpenBMC 2.8 Release
> Sent by: "openbmc" <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
> ------------------------------------------------------------------------
>
>
>
> On 5/4/20 1:29 AM, Deepak Kodihalli wrote:
> > On 04/05/20 10:43 am, Andrew Jeffery wrote:
> >>
> >>
> >> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
> >>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
> >>>> just add it directly here:
> >>>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
> >>> Added:
> >>>   * Yocto refresh to "Dunfell" version 3.1
> >>>   * Redfish support for: full certificate management, complete LDAP
> >>> management, full sensor support, event service schema, task schema
> >>>   * Move to Redfish Specification 1.9.0
> >>>   * Redfish support for 2019.4 Schemas
> >>>   * GUI enhancements: LDAP, certificate management
>
> We are targeting this Friday, June 5th for release 2.8. I'm not seeing
> much (or any) discussion on testing. If you have tested the release tag
> please post the results for your platform. Any blockers?
>
> https://github.com/openbmc/openbmc/releases
>
> Also, please review and add content to the release notes here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440
>
> Thanks everyone!
>
> Kurt Taylor (krtaylor)
>
> >>>
> >>> And removed "`Redfish configuration backup and restore function`".
> >>> James, Jason are you okay with the Redfish list above? Should we add
> >>> something about Storage & Drives? Anything else?
> >>>
> >>> Should we add something about the Kernel? "Move to 5.4"?
> >>>
> >>> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM
> >>> Support" and "Partial MCTP Support".
> >>
> >> Certainly MCTP support is still "Partial". Slowly progressing with
> >> help from
> >> Intel.
> >
> > Same goes for PLDM. There's definitely more PLDM specs and commands
> > implemented in libpldm since the 2.7 release though.
> >
> >> Andrew
> >>
> >
>
>
>
>
>

--------------99889758AC187E1B1B06EE27
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hello William,</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-net-ipmid/issues/12">https://github.com/openbmc/phosphor-net-ipmid/issues/12</a></p>
    This issue got reported on openbmc master which is needed for
    OpenBMC 2.8 release. The VLAN creation is failing via IPMI and the
    trace indicates the failure to delete the non static address. <br>
    This had worked on the earlier 2.7 community release. I have not
    followed much the changes on the phosphor-networkd front.<br>
    Since you had helped rewrite the transport handler. Can you help
    comment on the issue?<br>
    <br>
    Copying Johnathan, do you run into this on your platforms?<br>
    <br>
    Regards,<br>
    Tom<br>
    <br>
    <div class="moz-cite-prefix">On 05-06-2020 15:53, Prashanth Katti1
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@notes.na.collabserv.com">
      <meta http-equiv="content-type" content="text/html;
        charset=windows-1252">
      <span style=" font-size:10pt;font-family:sans-serif">Hi All,</span><br>
      <span style=" font-size:10pt;font-family:sans-serif">We tested
        Firmware version : 2.8.0-rc1-0-g35a774200 on Witherspoon, and
        found following issues.</span><br>
      <br>
      <span style=" font-size:10pt;font-family:sans-serif">DHCP        
                   - </span><a
        href="https://github.com/openbmc/bmcweb/issues/127"
        moz-do-not-send="true"><span style="
          font-size:10pt;color:blue;font-family:sans-serif">https://github.com/openbmc/bmcweb/issues/127</span></a><br>
      <span style=" font-size:10pt;font-family:sans-serif">LDAP        
                    - </span><a
        href="https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html"
        moz-do-not-send="true"><span style="
          font-size:10pt;color:blue;font-family:sans-serif">https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html</span></a><br>
      <span style=" font-size:10pt;font-family:sans-serif">VLAN via REST
        - </span><a
        href="https://github.com/openbmc/openbmc/issues/3668"
        moz-do-not-send="true"><span style="
          font-size:10pt;color:blue;font-family:sans-serif">https://github.com/openbmc/openbmc/issues/3668</span></a><br>
      <span style=" font-size:10pt;font-family:sans-serif">VLAN via IPMI
            - </span><a
        href="https://github.com/openbmc/phosphor-net-ipmid/issues/12"
        moz-do-not-send="true"><span style="
          font-size:10pt;color:blue;font-family:sans-serif">https://github.com/openbmc/phosphor-net-ipmid/issues/12</span></a><br>
      <br>
      <span style=" font-size:10pt;font-family:sans-serif">Rest of the
        functionalities looks good and are stable in our testing.</span><br>
      <span style=" font-size:10pt;font-family:sans-serif">Hope this
        input helps.</span><br>
      <br>
      <span style=" font-size:10pt;font-family:sans-serif">Prashanth
        Katti</span><br>
      <br>
      <br>
      <br>
      <br>
      <span style=" font-size:9pt;color:#5f5f5f;font-family:sans-serif">From:
               </span><span style="
        font-size:9pt;font-family:sans-serif">krtaylor <a
          class="moz-txt-link-rfc2396E"
          href="mailto:kurt.r.taylor@gmail.com">&lt;kurt.r.taylor@gmail.com&gt;</a></span><br>
      <span style=" font-size:9pt;color:#5f5f5f;font-family:sans-serif">To:
               </span><span style="
        font-size:9pt;font-family:sans-serif">OpenBMC Maillist <a
          class="moz-txt-link-rfc2396E"
          href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a></span><br>
      <span style=" font-size:9pt;color:#5f5f5f;font-family:sans-serif">Date:
               </span><span style="
        font-size:9pt;font-family:sans-serif">03-06-2020 00:46</span><br>
      <span style=" font-size:9pt;color:#5f5f5f;font-family:sans-serif">Subject:
               </span><span style="
        font-size:9pt;font-family:sans-serif">[EXTERNAL] Re: OpenBMC 2.8
        Release</span><br>
      <span style=" font-size:9pt;color:#5f5f5f;font-family:sans-serif">Sent
        by:        </span><span style="
        font-size:9pt;font-family:sans-serif">"openbmc" <a
          class="moz-txt-link-rfc2396E"
          href="mailto:openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org">&lt;openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org&gt;</a></span><br>
      <hr noshade="noshade"><br>
      <br>
      <br>
      <tt><span style=" font-size:10pt">On 5/4/20 1:29 AM, Deepak
          Kodihalli wrote:<br>
          &gt; On 04/05/20 10:43 am, Andrew Jeffery wrote:<br>
          &gt;&gt;<br>
          &gt;&gt;<br>
          &gt;&gt; On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:<br>
          &gt;&gt;&gt; On 4/29/2020 10:48 AM, Kurt Taylor wrote:<br>
          &gt;&gt;&gt;&gt; just add it directly here:<br>
          &gt;&gt;&gt;&gt; </span></tt><a
        href="https://github.com/openbmc/openbmc/wiki/Current-Release-Content"
        moz-do-not-send="true"><tt><span style=" font-size:10pt">https://github.com/openbmc/openbmc/wiki/Current-Release-Content</span></tt></a><tt><span
          style=" font-size:10pt"><br>
          &gt;&gt;&gt; Added:<br>
          &gt;&gt;&gt;   * Yocto refresh to "Dunfell" version 3.1<br>
          &gt;&gt;&gt;   * Redfish support for: full certificate
          management, complete LDAP<br>
          &gt;&gt;&gt; management, full sensor support, event service
          schema, task schema<br>
          &gt;&gt;&gt;   * Move to Redfish Specification 1.9.0<br>
          &gt;&gt;&gt;   * Redfish support for 2019.4 Schemas<br>
          &gt;&gt;&gt;   * GUI enhancements: LDAP, certificate
          management<br>
          <br>
          We are targeting this Friday, June 5th for release 2.8. I'm
          not seeing <br>
          much (or any) discussion on testing. If you have tested the
          release tag <br>
          please post the results for your platform. Any blockers?<br>
          <br>
        </span></tt><a
        href="https://github.com/openbmc/openbmc/releases"
        moz-do-not-send="true"><tt><span style=" font-size:10pt">https://github.com/openbmc/openbmc/releases</span></tt></a><tt><span
          style=" font-size:10pt"><br>
          <br>
          Also, please review and add content to the release notes here:<br>
          <br>
        </span></tt><a
        href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440"
        moz-do-not-send="true"><tt><span style=" font-size:10pt">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440</span></tt></a><tt><span
          style=" font-size:10pt"><br>
          <br>
          Thanks everyone!<br>
          <br>
          Kurt Taylor (krtaylor)<br>
          <br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; And removed "`Redfish configuration backup and
          restore function`".<br>
          &gt;&gt;&gt; James, Jason are you okay with the Redfish list
          above? Should we add<br>
          &gt;&gt;&gt; something about Storage &amp; Drives? Anything
          else?<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; Should we add something about the Kernel? "Move
          to 5.4"?<br>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; Anything for PLDM / MCTP? For the 2.7 release it
          says "Partial PLDM<br>
          &gt;&gt;&gt; Support" and "Partial MCTP Support".<br>
          &gt;&gt;<br>
          &gt;&gt; Certainly MCTP support is still "Partial". Slowly
          progressing with <br>
          &gt;&gt; help from<br>
          &gt;&gt; Intel.<br>
          &gt; <br>
          &gt; Same goes for PLDM. There's definitely more PLDM specs
          and commands <br>
          &gt; implemented in libpldm since the 2.7 release though.<br>
          &gt; <br>
          &gt;&gt; Andrew<br>
          &gt;&gt;<br>
          &gt; <br>
          <br>
        </span></tt><br>
      <br>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------99889758AC187E1B1B06EE27--

