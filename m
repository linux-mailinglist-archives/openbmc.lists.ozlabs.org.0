Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AFB17358
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:12:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zTj63sTPzDqLT
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:12:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zThC32zbzDqBN
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:11:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4882kcS066100
 for <openbmc@lists.ozlabs.org>; Wed, 8 May 2019 04:11:20 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sbu8g0b7m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 04:11:19 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 8 May 2019 09:11:18 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 09:11:16 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x488BFhJ39125042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 08:11:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA0511C054;
 Wed,  8 May 2019 08:11:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08DCB11C04A;
 Wed,  8 May 2019 08:11:15 +0000 (GMT)
Received: from [9.122.210.224] (unknown [9.122.210.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 08:11:14 +0000 (GMT)
Subject: Re: BMC health metrics (again!)
To: Kun Yi <kunyi@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 8 May 2019 13:41:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0B5BBB7113F6932B3015BCF3"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050808-0016-0000-0000-0000027978DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050808-0017-0000-0000-000032D626C2
Message-Id: <a28747c1-a6c5-65c9-87da-d8df0ce0b14e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905080052
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
--------------0B5BBB7113F6932B3015BCF3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Kun,

Thanks for initiating it. I liked the /proc parsing. On the IPMI thing, 
is it only targeted to IPMI -or- a generic BMC-Host communication kink ?

Some of the things in my wish-list are:

1/. Flash wear and tear detection and the threshold to be a config option
2/. Any SoC specific health checks ( If that is exposed )
3/. Mechanism to detect spurious interrupts on any HW link
4/. Some kind of check to see if there will be any I2C lock to a given 
end device
5/. Ability to detect errors on HW links

On the watchdog(8) area, I was just thinking these:

How about having some kind of BMC_health D-Bus properties -or- a compile 
time feed, whose values can be fed into a configuration file than 
watchdog using the default /etc/watchdog.conf always. If the properties 
are coming from a D-Bus, then we could either append to 
/etc/watchdog.conf -or- treat those values only as the config file that 
can be given to watchdog.
The systemd service files to be setup accordingly.


We have seen instances where we get an error that is indicating no 
resources available. Those could be file descriptors / socket 
descriptors etc. A way to plug this into watchdog as part of test binary 
that checks for this ? We could hook a repair-binary to take the action.


Another thing that I was looking at hooking into watchdog is the test to 
see the file system usage as defined by the policy.
Policy could mention the file system mounts and also the threshold.

For example, /tmp , /root etc.. We could again hook a repair binary to 
do some cleanup if needed

If we see the list is growing with these custom requirements, then 
probably does not make sense to pollute the watchdog(2) but
have these consumed into the app instead ?

!! Vishwa !!

On 4/9/19 9:55 PM, Kun Yi wrote:
> Hello there,
>
> This topic has been brought up several times on the mailing list and 
> offline, but in general seems we as a community didn't reach a 
> consensus on what things would be the most valuable to monitor, and 
> how to monitor them. While it seems a general purposed monitoring 
> infrastructure for OpenBMC is a hard problem, I have some simple ideas 
> that I hope can provide immediate and direct benefits.
>
> 1. Monitoring host IPMI link reliability (host side)
>
> The essentials I want are "IPMI commands sent" and "IPMI commands 
> succeeded" counts over time. More metrics like response time would 
> be helpful as well. The issue to address here: when some IPMI sensor 
> readings are flaky, it would be really helpful to tell from IPMI 
> command stats to determine whether it is a hardware issue, or IPMI 
> issue. Moreover, it would be a very useful regression test metric for 
> rolling out new BMC software.
>
> Looking at the host IPMI side, there is some metrics exposed 
> through /proc/ipmi/0/si_stats if ipmi_si driver is used, but I haven't 
> dug into whether it contains information mapping to the interrupts. 
> Time to read the source code I guess.
>
> Another idea would be to instrument caller libraries like the 
> interfaces in ipmitool, though I feel that approach is harder due to 
> fragmentation of IPMI libraries.
>
> 2. Read and expose core BMC performance metrics from procfs
>
> This is straightforward: have a smallish daemon (or bmc-state-manager) 
> read,parse, and process procfs and put values on D-Bus. Core metrics 
> I'm interested in getting through this way: load average, memory, disk 
> used/available, net stats... The values can then simply be exported as 
> IPMI sensors or Redfish resource properties.
>
> A nice byproduct of this effort would be a procfs parsing library. 
> Since different platforms would probably have different monitoring 
> requirements and procfs output format has no standard, I'm thinking 
> the user would just provide a configuration file containing list of 
> (procfs path, property regex, D-Bus property name), and the 
> compile-time generated code to provide an object for each property.
>
> All of this is merely thoughts and nothing concrete. With that said, 
> it would be really great if you could provide some feedback such as "I 
> want this, but I really need that feature", or let me know it's all 
> implemented already :)
>
> If this seems valuable, after gathering more feedback of feature 
> requirements, I'm going to turn them into design docs and upload for 
> review.
>
> -- 
> Regards,
> Kun

--------------0B5BBB7113F6932B3015BCF3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Kun,</p>
    <p>Thanks for initiating it. I liked the /proc parsing. On the IPMI
      thing, is it only targeted to IPMI -or- a generic BMC-Host
      communication kink ?<br>
    </p>
    <p>Some of the things in my wish-list are:<br>
    </p>
    <p>1/. Flash wear and tear detection and the threshold to be a
      config option<br>
      2/. Any SoC specific health checks ( If that is exposed )<br>
      3/. Mechanism to detect spurious interrupts on any HW link<br>
      4/. Some kind of check to see if there will be any I2C lock to a
      given end device<br>
      5/. Ability to detect errors on HW links</p>
    <p>On the watchdog(8) area, I was just thinking these:<br>
    </p>
    <p>How about having some kind of BMC_health D-Bus properties -or- a
      compile time feed, whose values can be fed into a configuration
      file than watchdog using the default /etc/watchdog.conf always. If
      the properties are coming from a D-Bus, then we could either
      append to /etc/watchdog.conf -or- treat those values only as the
      config file that can be given to watchdog.<br>
      The systemd service files to be setup accordingly.<br>
    </p>
    <p><br>
      We have seen instances where we get an error that is indicating no
      resources available. Those could be file descriptors / socket
      descriptors etc. A way to plug this into watchdog as part of test
      binary that checks for this ? We could hook a repair-binary to
      take the action.<br>
    </p>
    <p><br>
      Another thing that I was looking at hooking into watchdog is the
      test to see the file system usage as defined by the policy.<br>
      Policy could mention the file system mounts and also the
      threshold.<br>
      <br>
      For example, /tmp , /root etc.. We could again hook a repair
      binary to do some cleanup if needed<br>
      <br>
      If we see the list is growing with these custom requirements, then
      probably does not make sense to pollute the watchdog(2) but<br>
      have these consumed into the app instead ?</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 4/9/19 9:55 PM, Kun Yi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div>
            <div>Hello there,</div>
            <div><br>
            </div>
            <div>This topic has been brought up several times on the
              mailing list and offline, but in general seems we as a
              community didn't reach a consensus on what things would be
              the most valuable to monitor, and how to monitor them.
              While it seems a general purposed monitoring
              infrastructure for OpenBMC is a hard problem, I have some
              simple ideas that I hope can provide immediate and direct
              benefits.</div>
            <div><br>
            </div>
            <div>1. Monitoring host IPMI link reliability (host side)</div>
            <div><br>
            </div>
            <div>The essentials I want are "IPMI commands sent" and
              "IPMI commands succeeded" counts over time. More metrics
              like response time would be helpful as well. The issue to
              address here: when some IPMI sensor readings are flaky, it
              would be really helpful to tell from IPMI command stats to
              determine whether it is a hardware issue, or IPMI issue.
              Moreover, it would be a very useful regression test metric
              for rolling out new BMC software.</div>
            <div><br>
            </div>
            <div>Looking at the host IPMI side, there is some metrics
              exposed through /proc/ipmi/0/si_stats if ipmi_si driver is
              used, but I haven't dug into whether it contains
              information mapping to the interrupts. Time to read the
              source code I guess.</div>
            <div><br>
            </div>
            <div>Another idea would be to instrument caller libraries
              like the interfaces in ipmitool, though I feel that
              approach is harder due to fragmentation of IPMI libraries.</div>
            <div><br>
            </div>
            <div>2. Read and expose core BMC performance metrics from
              procfs</div>
            <div><br>
            </div>
            <div>This is straightforward: have a smallish daemon (or
              bmc-state-manager) read,parse, and process procfs and put
              values on D-Bus. Core metrics I'm interested in getting
              through this way: load average, memory, disk
              used/available, net stats... The values can then simply be
              exported as IPMI sensors or Redfish resource properties.</div>
            <div><br>
            </div>
            <div>A nice byproduct of this effort would be a procfs
              parsing library. Since different platforms would probably
              have different monitoring requirements and procfs output
              format has no standard, I'm thinking the user would just
              provide a configuration file containing list of (procfs
              path, property regex, D-Bus property name), and the
              compile-time generated code to provide an object for each
              property. </div>
            <div><br>
            </div>
            <div>All of this is merely thoughts and nothing concrete.
              With that said, it would be really great if you could
              provide some feedback such as "I want this, but I really
              need that feature", or let me know it's all implemented
              already :)</div>
            <div><br>
            </div>
            <div>If this seems valuable, after gathering more feedback
              of feature requirements, I'm going to turn them into
              design docs and upload for review.</div>
            <div><br>
            </div>
            -- <br>
            <div dir="ltr"
              class="m_894391115062551385m_1187092449188926744gmail_signature">
              <div dir="ltr">Regards,
                <div>Kun</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0B5BBB7113F6932B3015BCF3--

