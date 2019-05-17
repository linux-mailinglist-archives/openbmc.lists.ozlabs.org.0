Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28521D47
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 20:26:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455GvY5QqMzDqTF
	for <lists+openbmc@lfdr.de>; Sat, 18 May 2019 04:26:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 455Gv10sGBzDqS3
 for <openbmc@lists.ozlabs.org>; Sat, 18 May 2019 04:25:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HIMmdd129191
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 14:25:43 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shxtdgdmt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 14:25:43 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 17 May 2019 19:25:41 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 19:25:40 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4HIPdpH50921724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 18:25:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 648935204F;
 Fri, 17 May 2019 18:25:39 +0000 (GMT)
Received: from [9.102.1.15] (unknown [9.102.1.15])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 101EA52057;
 Fri, 17 May 2019 18:25:37 +0000 (GMT)
Subject: Re: BMC health metrics (again!)
To: Kun Yi <kunyi@google.com>
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <a28747c1-a6c5-65c9-87da-d8df0ce0b14e@linux.vnet.ibm.com>
 <BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <83b3990a-19c0-a0af-a28a-cedf8401bffb@linux.vnet.ibm.com>
 <BL0PR2101MB0932823408EE75DB889F3C3DC80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <c6ac62c1-48b4-0df8-fbff-8172275ef8b1@linux.vnet.ibm.com>
 <CAGMNF6XyH-VGRh18acGUbJniJ_YLW-3dz6sFJTvKbO7ZraJcZA@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 17 May 2019 23:55:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGMNF6XyH-VGRh18acGUbJniJ_YLW-3dz6sFJTvKbO7ZraJcZA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4A3C6FE3BD513DAC456F781D"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051718-0016-0000-0000-0000027CD824
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051718-0017-0000-0000-000032D9B64D
Message-Id: <760bfb69-e30a-6d4c-ef6f-098e12a67f1b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170108
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4A3C6FE3BD513DAC456F781D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

This is great !!

Neeraj / Kun, Were you guys planning on putting an initial proposal ?

!! Vishwa !!

On 5/17/19 9:20 PM, Kun Yi wrote:
> I'd also like to be in the metric workgroup. Neeraj, I can see the 
> first and second point you listed aligns with my goals in the original 
> proposal very well.
>
> On Fri, May 17, 2019 at 12:28 AM vishwa <vishwa@linux.vnet.ibm.com 
> <mailto:vishwa@linux.vnet.ibm.com>> wrote:
>
>     IMO, we could start fresh here. The initial thought was an year+ ago.
>
>     !! Vishwa !!
>
>     On 5/17/19 12:53 PM, Neeraj Ladkani wrote:
>>     Sure thing. Is there an design document that exist for this
>>     feature ?
>>
>>     I can volunteer to drive this work group if we have quorum.
>>
>>     Neeraj
>>
>>     Get Outlook for Android <https://aka.ms/ghei36>
>>
>>     ------------------------------------------------------------------------
>>     *From:* vishwa <vishwa@linux.vnet.ibm.com>
>>     <mailto:vishwa@linux.vnet.ibm.com>
>>     *Sent:* Friday, May 17, 2019 12:17:51 AM
>>     *To:* Neeraj Ladkani; Kun Yi; OpenBMC Maillist
>>     *Subject:* Re: BMC health metrics (again!)
>>
>>     Neeraj,
>>
>>     Thanks for the inputs. It's nice to see us having a similar thought.
>>
>>     AFAIK, we don't have any work-group that is driving “Platform
>>     telemetry and health monitoring”. Also, do we want to see this as
>>     2 different entities ?. In the past, there were thoughts about
>>     using websockets to channel some of the thermal parameters as
>>     telemetry data. But then it was not implemented.
>>
>>     We can discuss here I think.
>>
>>     !! Vishwa !!
>>
>>     On 5/17/19 12:00 PM, Neeraj Ladkani wrote:
>>>
>>>     At cloud scale, telemetry and health monitoring is very
>>>     critical. We should define a framework that allows platform
>>>     owners to add their own telemetry hooks. Telemetry service
>>>     should be designed to make this data accessible and store in
>>>     resilient way (like blackbox during plane crash).
>>>
>>>     Is there any workgroup that drives this feature “Platform
>>>     telemetry and health monitoring” ?
>>>
>>>     Wishlist
>>>
>>>     BMC telemetry :
>>>
>>>      1. Linux subsystem
>>>          1. Uptime
>>>          2. CPU Load average
>>>          3. Memory info
>>>          4. Storage usage ( RW )
>>>          5. Dmesg
>>>          6. Syslog
>>>          7. FDs of critical processes
>>>          8. Alignment traps
>>>          9. WDT excursions
>>>      2. IPMI subsystem
>>>          1. Request and Response logging par interface with
>>>             timestamps ( KCS, LAN, USB)
>>>          2. Request and Response of IPMB
>>>
>>>     i.Request , Response, No of Retries
>>>
>>>      3. Misc
>>>
>>>      1. Critical Temperature Excursions
>>>
>>>     i.Minimum Reading of Sensor
>>>
>>>     ii.Max Reading of a sensor
>>>
>>>     iii.Count of state transition
>>>
>>>     iv.Retry Count
>>>
>>>      2. Count of assertions/deassertions of GPIO and ability to
>>>         capture the state
>>>      3. timestamp of last assertion/deassertion of GPIO
>>>
>>>     Thanks
>>>
>>>     ~Neeraj
>>>
>>>     *From:*openbmc
>>>     <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org>
>>>     <mailto:openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org>
>>>     *On Behalf Of *vishwa
>>>     *Sent:* Wednesday, May 8, 2019 1:11 AM
>>>     *To:* Kun Yi <kunyi@google.com> <mailto:kunyi@google.com>;
>>>     OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>>     <mailto:openbmc@lists.ozlabs.org>
>>>     *Subject:* Re: BMC health metrics (again!)
>>>
>>>     Hello Kun,
>>>
>>>     Thanks for initiating it. I liked the /proc parsing. On the IPMI
>>>     thing, is it only targeted to IPMI -or- a generic BMC-Host
>>>     communication kink ?
>>>
>>>     Some of the things in my wish-list are:
>>>
>>>     1/. Flash wear and tear detection and the threshold to be a
>>>     config option
>>>     2/. Any SoC specific health checks ( If that is exposed )
>>>     3/. Mechanism to detect spurious interrupts on any HW link
>>>     4/. Some kind of check to see if there will be any I2C lock to a
>>>     given end device
>>>     5/. Ability to detect errors on HW links
>>>
>>>     On the watchdog(8) area, I was just thinking these:
>>>
>>>     How about having some kind of BMC_health D-Bus properties -or- a
>>>     compile time feed, whose values can be fed into a configuration
>>>     file than watchdog using the default /etc/watchdog.conf always.
>>>     If the properties are coming from a D-Bus, then we could either
>>>     append to /etc/watchdog.conf -or- treat those values only as the
>>>     config file that can be given to watchdog.
>>>     The systemd service files to be setup accordingly.
>>>
>>>
>>>     We have seen instances where we get an error that is indicating
>>>     no resources available. Those could be file descriptors / socket
>>>     descriptors etc. A way to plug this into watchdog as part of
>>>     test binary that checks for this ? We could hook a repair-binary
>>>     to take the action.
>>>
>>>
>>>     Another thing that I was looking at hooking into watchdog is the
>>>     test to see the file system usage as defined by the policy.
>>>     Policy could mention the file system mounts and also the threshold.
>>>
>>>     For example, /tmp , /root etc.. We could again hook a repair
>>>     binary to do some cleanup if needed
>>>
>>>     If we see the list is growing with these custom requirements,
>>>     then probably does not make sense to pollute the watchdog(2) but
>>>     have these consumed into the app instead ?
>>>
>>>     !! Vishwa !!
>>>
>>>     On 4/9/19 9:55 PM, Kun Yi wrote:
>>>
>>>         Hello there,
>>>
>>>         This topic has been brought up several times on the mailing
>>>         list and offline, but in general seems we as a community
>>>         didn't reach a consensus on what things would be the most
>>>         valuable to monitor, and how to monitor them. While it seems
>>>         a general purposed monitoring infrastructure for OpenBMC is
>>>         a hard problem, I have some simple ideas that I hope can
>>>         provide immediate and direct benefits.
>>>
>>>         1. Monitoring host IPMI link reliability (host side)
>>>
>>>         The essentials I want are "IPMI commands sent" and "IPMI
>>>         commands succeeded" counts over time. More metrics like
>>>         response time would be helpful as well. The issue to address
>>>         here: when some IPMI sensor readings are flaky, it would be
>>>         really helpful to tell from IPMI command stats to determine
>>>         whether it is a hardware issue, or IPMI issue. Moreover, it
>>>         would be a very useful regression test metric for rolling
>>>         out new BMC software.
>>>
>>>         Looking at the host IPMI side, there is some metrics exposed
>>>         through /proc/ipmi/0/si_stats if ipmi_si driver is used, but
>>>         I haven't dug into whether it contains information mapping
>>>         to the interrupts. Time to read the source code I guess.
>>>
>>>         Another idea would be to instrument caller libraries like
>>>         the interfaces in ipmitool, though I feel that approach is
>>>         harder due to fragmentation of IPMI libraries.
>>>
>>>         2. Read and expose core BMC performance metrics from procfs
>>>
>>>         This is straightforward: have a smallish daemon (or
>>>         bmc-state-manager) read,parse, and process procfs and put
>>>         values on D-Bus. Core metrics I'm interested in getting
>>>         through this way: load average, memory, disk used/available,
>>>         net stats... The values can then simply be exported as IPMI
>>>         sensors or Redfish resource properties.
>>>
>>>         A nice byproduct of this effort would be a procfs parsing
>>>         library. Since different platforms would probably have
>>>         different monitoring requirements and procfs output format
>>>         has no standard, I'm thinking the user would just provide a
>>>         configuration file containing list of (procfs path, property
>>>         regex, D-Bus property name), and the compile-time generated
>>>         code to provide an object for each property.
>>>
>>>         All of this is merely thoughts and nothing concrete. With
>>>         that said, it would be really great if you could provide
>>>         some feedback such as "I want this, but I really need that
>>>         feature", or let me know it's all implemented already :)
>>>
>>>         If this seems valuable, after gathering more feedback of
>>>         feature requirements, I'm going to turn them into design
>>>         docs and upload for review.
>>>
>>>         -- 
>>>
>>>         Regards,
>>>
>>>         Kun
>>>
>
>
> -- 
> Regards,
> Kun

--------------4A3C6FE3BD513DAC456F781D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>This is great !!</p>
    <p>Neeraj / Kun, Were you guys planning on putting an initial
      proposal ?</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 5/17/19 9:20 PM, Kun Yi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGMNF6XyH-VGRh18acGUbJniJ_YLW-3dz6sFJTvKbO7ZraJcZA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">I'd also like to be in the metric workgroup.
        Neeraj, I can see the first and second point you listed aligns
        with my goals in the original proposal very well.</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, May 17, 2019 at 12:28
          AM vishwa &lt;<a href="mailto:vishwa@linux.vnet.ibm.com"
            moz-do-not-send="true">vishwa@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor="#FFFFFF">
            <p>IMO, we could start fresh here. The initial thought was
              an year+ ago.</p>
            <p>!! Vishwa !!<br>
            </p>
            <div class="gmail-m_1275227641964777196moz-cite-prefix">On
              5/17/19 12:53 PM, Neeraj Ladkani wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="auto"
style="direction:ltr;margin:0px;padding:0px;font-family:sans-serif;font-size:11pt;color:black">
                Sure thing. Is there an design document that exist for
                this feature ? <br>
                <br>
              </div>
              <div dir="auto"
style="direction:ltr;margin:0px;padding:0px;font-family:sans-serif;font-size:11pt;color:black">
                I can volunteer to drive this work group if we have
                quorum.<br>
                <br>
              </div>
              <div dir="auto"
style="direction:ltr;margin:0px;padding:0px;font-family:sans-serif;font-size:11pt;color:black">
                Neeraj <br>
                <br>
              </div>
              <div dir="auto"
style="direction:ltr;margin:0px;padding:0px;font-family:sans-serif;font-size:11pt;color:black">
                <span id="gmail-m_1275227641964777196OutlookSignature">
                  <div dir="auto"
style="direction:ltr;margin:0px;padding:0px;font-family:sans-serif;font-size:11pt;color:black">
                    Get <a href="https://aka.ms/ghei36" target="_blank"
                      moz-do-not-send="true">Outlook for Android</a></div>
                </span><br>
              </div>
              <hr style="display:inline-block;width:98%">
              <div id="gmail-m_1275227641964777196divRplyFwdMsg"
                dir="ltr"><font style="font-size:11pt" face="Calibri,
                  sans-serif" color="#000000"><b>From:</b> vishwa <a
                    class="gmail-m_1275227641964777196moz-txt-link-rfc2396E"
                    href="mailto:vishwa@linux.vnet.ibm.com"
                    target="_blank" moz-do-not-send="true">&lt;vishwa@linux.vnet.ibm.com&gt;</a><br>
                  <b>Sent:</b> Friday, May 17, 2019 12:17:51 AM<br>
                  <b>To:</b> Neeraj Ladkani; Kun Yi; OpenBMC Maillist<br>
                  <b>Subject:</b> Re: BMC health metrics (again!)</font>
                <div> </div>
              </div>
              <div>
                <p>Neeraj,</p>
                <p>Thanks for the inputs. It's nice to see us having a
                  similar thought.</p>
                <p>AFAIK, we don't have any work-group that is driving <span
                    style="color:windowtext"> “Platform telemetry and
                    health monitoring”. Also, do we want to see this as
                    2 different entities ?. In the past, there were
                    thoughts about using websockets to channel some of
                    the thermal parameters as telemetry data. But then
                    it was not implemented.</span></p>
                <p><span style="color:windowtext">We can discuss here I
                    think.</span></p>
                <p><span style="color:windowtext">!! Vishwa !!<br>
                  </span></p>
                <div class="gmail-m_1275227641964777196moz-cite-prefix">On
                  5/17/19 12:00 PM, Neeraj Ladkani wrote:<br>
                </div>
                <blockquote type="cite">
                  <div class="gmail-m_1275227641964777196WordSection1">
                    <p class="MsoNormal"><span style="color:windowtext">At
                        cloud scale, telemetry and health monitoring is
                        very critical. We should define a framework that
                        allows platform owners to add their own
                        telemetry hooks. Telemetry service should be
                        designed to make this data accessible and store
                        in resilient way (like blackbox during plane
                        crash).  </span></p>
                    <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                    <p class="MsoNormal"><span style="color:windowtext">Is
                        there any workgroup that drives this feature
                        “Platform telemetry and health monitoring” ? </span></p>
                    <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                    <p class="MsoNormal"><span style="color:windowtext">Wishlist</span></p>
                    <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                    <p class="MsoNormal"><span style="color:windowtext">BMC
                        telemetry : </span></p>
                    <ol style="margin-top:0in" start="1" type="1">
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph"
                        style="color:windowtext;margin-left:0in"> Linux
                        subsystem</li>
                      <ol style="margin-top:0in" start="1" type="a">
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Uptime</li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in"> CPU
                          Load average</li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Memory info</li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Storage usage ( RW )  </li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Dmesg</li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Syslog </li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in"> FDs
                          of critical processes </li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Alignment traps </li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in"> WDT
                          excursions </li>
                      </ol>
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph"
                        style="color:windowtext;margin-left:0in"> IPMI
                        subsystem</li>
                      <ol style="margin-top:0in" start="1" type="a">
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Request and Response logging par interface
                          with timestamps ( KCS, LAN, USB)</li>
                        <li
                          class="gmail-m_1275227641964777196MsoListParagraph"
                          style="color:windowtext;margin-left:0in">
                          Request and Response of IPMB</li>
                      </ol>
                    </ol>
                    <p
                      class="gmail-m_1275227641964777196MsoListParagraph"
                      style="margin-left:1.5in"> <span
                        style="color:windowtext"><span><span
                            style="font:7pt &quot;Times New Roman&quot;">                                                              
                          </span>i.<span>      </span> </span></span><span
                        style="color:windowtext">Request , Response, No
                        of Retries</span></p>
                    <ol style="margin-top:0in" start="3" type="1">
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph"
                        style="color:windowtext;margin-left:0in"> Misc</li>
                    </ol>
                    <ol style="margin-top:0in" start="1" type="a">
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph"
                        style="color:windowtext">Critical Temperature
                        Excursions </li>
                    </ol>
                    <p
                      class="gmail-m_1275227641964777196MsoListParagraph"
                      style="margin-left:1.5in"> <span
                        style="color:windowtext"><span><span
                            style="font:7pt &quot;Times New Roman&quot;">                                                              
                          </span>i.<span>      </span> </span></span><span
                        style="color:windowtext">Minimum Reading of
                        Sensor</span></p>
                    <p
                      class="gmail-m_1275227641964777196MsoListParagraph"
                      style="margin-left:1.5in"> <span
                        style="color:windowtext"><span><span
                            style="font:7pt &quot;Times New Roman&quot;">                                                            
                          </span>ii.<span>      </span> </span></span><span
                        style="color:windowtext">Max Reading of a sensor</span></p>
                    <p
                      class="gmail-m_1275227641964777196MsoListParagraph"
                      style="margin-left:1.5in"> <span
                        style="color:windowtext"><span><span
                            style="font:7pt &quot;Times New Roman&quot;">                                                          
                          </span>iii.<span>      </span> </span></span><span
                        style="color:windowtext">Count of state
                        transition</span></p>
                    <p
                      class="gmail-m_1275227641964777196MsoListParagraph"
                      style="margin-left:1.5in"> <span
                        style="color:windowtext"><span><span
                            style="font:7pt &quot;Times New Roman&quot;">                                                          
                          </span>iv.<span>      </span> </span></span><span
                        style="color:windowtext">Retry Count</span></p>
                    <ol style="margin-top:0in" start="2" type="a">
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph">Count
                        of assertions/deassertions of GPIO and ability
                        to capture the state</li>
                      <li
                        class="gmail-m_1275227641964777196MsoListParagraph">timestamp
                        of last assertion/deassertion of GPIO</li>
                    </ol>
                    <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                    <p class="MsoNormal"><span style="color:windowtext">Thanks</span></p>
                    <p class="MsoNormal"><span style="color:windowtext">~Neeraj</span></p>
                    <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                    <div>
                      <div
style="border-right:none;border-bottom:none;border-left:none;border-top:1pt
                        solid rgb(225,225,225);padding:3pt 0in 0in">
                        <p class="MsoNormal"><b><span
                              style="color:windowtext">From:</span></b><span
                            style="color:windowtext"> openbmc <a
                              class="gmail-m_1275227641964777196moz-txt-link-rfc2396E"
href="mailto:openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org"
                              target="_blank" moz-do-not-send="true">
&lt;openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org&gt;</a> <b>On
                              Behalf Of </b>vishwa<br>
                            <b>Sent:</b> Wednesday, May 8, 2019 1:11 AM<br>
                            <b>To:</b> Kun Yi <a
                              class="gmail-m_1275227641964777196moz-txt-link-rfc2396E"
                              href="mailto:kunyi@google.com"
                              target="_blank" moz-do-not-send="true">
                              &lt;kunyi@google.com&gt;</a>; OpenBMC
                            Maillist <a
                              class="gmail-m_1275227641964777196moz-txt-link-rfc2396E"
                              href="mailto:openbmc@lists.ozlabs.org"
                              target="_blank" moz-do-not-send="true">
                              &lt;openbmc@lists.ozlabs.org&gt;</a><br>
                            <b>Subject:</b> Re: BMC health metrics
                            (again!)</span></p>
                      </div>
                    </div>
                    <p class="MsoNormal"> </p>
                    <p>Hello Kun,</p>
                    <p>Thanks for initiating it. I liked the /proc
                      parsing. On the IPMI thing, is it only targeted to
                      IPMI -or- a generic BMC-Host communication kink ?</p>
                    <p>Some of the things in my wish-list are:</p>
                    <p>1/. Flash wear and tear detection and the
                      threshold to be a config option<br>
                      2/. Any SoC specific health checks ( If that is
                      exposed )<br>
                      3/. Mechanism to detect spurious interrupts on any
                      HW link<br>
                      4/. Some kind of check to see if there will be any
                      I2C lock to a given end device<br>
                      5/. Ability to detect errors on HW links</p>
                    <p>On the watchdog(8) area, I was just thinking
                      these:</p>
                    <p>How about having some kind of BMC_health D-Bus
                      properties -or- a compile time feed, whose values
                      can be fed into a configuration file than watchdog
                      using the default /etc/watchdog.conf always. If
                      the properties are coming from a D-Bus, then we
                      could either append to /etc/watchdog.conf -or-
                      treat those values only as the config file that
                      can be given to watchdog.<br>
                      The systemd service files to be setup accordingly.</p>
                    <p><br>
                      We have seen instances where we get an error that
                      is indicating no resources available. Those could
                      be file descriptors / socket descriptors etc. A
                      way to plug this into watchdog as part of test
                      binary that checks for this ? We could hook a
                      repair-binary to take the action.</p>
                    <p><br>
                      Another thing that I was looking at hooking into
                      watchdog is the test to see the file system usage
                      as defined by the policy.<br>
                      Policy could mention the file system mounts and
                      also the threshold.<br>
                      <br>
                      For example, /tmp , /root etc.. We could again
                      hook a repair binary to do some cleanup if needed<br>
                      <br>
                      If we see the list is growing with these custom
                      requirements, then probably does not make sense to
                      pollute the watchdog(2) but<br>
                      have these consumed into the app instead ?</p>
                    <p>!! Vishwa !!</p>
                    <div>
                      <p class="MsoNormal">On 4/9/19 9:55 PM, Kun Yi
                        wrote:</p>
                    </div>
                    <blockquote style="margin-top:5pt;margin-bottom:5pt">
                      <div>
                        <div>
                          <div>
                            <div>
                              <p class="MsoNormal">Hello there,</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">This topic has been
                                brought up several times on the mailing
                                list and offline, but in general seems
                                we as a community didn't reach a
                                consensus on what things would be the
                                most valuable to monitor, and how to
                                monitor them. While it seems a general
                                purposed monitoring infrastructure for
                                OpenBMC is a hard problem, I have some
                                simple ideas that I hope can provide
                                immediate and direct benefits.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">1. Monitoring host
                                IPMI link reliability (host side)</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">The essentials I want
                                are "IPMI commands sent" and "IPMI
                                commands succeeded" counts over time.
                                More metrics like response time would
                                be helpful as well. The issue to address
                                here: when some IPMI sensor readings are
                                flaky, it would be really helpful to
                                tell from IPMI command stats to
                                determine whether it is a hardware
                                issue, or IPMI issue. Moreover, it would
                                be a very useful regression test metric
                                for rolling out new BMC software.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">Looking at the host
                                IPMI side, there is some metrics exposed
                                through /proc/ipmi/0/si_stats if ipmi_si
                                driver is used, but I haven't dug into
                                whether it contains information mapping
                                to the interrupts. Time to read the
                                source code I guess.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">Another idea would be
                                to instrument caller libraries like the
                                interfaces in ipmitool, though I feel
                                that approach is harder due to
                                fragmentation of IPMI libraries.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">2. Read and expose
                                core BMC performance metrics from procfs</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">This is
                                straightforward: have a smallish daemon
                                (or bmc-state-manager) read,parse, and
                                process procfs and put values on D-Bus.
                                Core metrics I'm interested in getting
                                through this way: load average, memory,
                                disk used/available, net stats... The
                                values can then simply be exported as
                                IPMI sensors or Redfish resource
                                properties.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">A nice byproduct of
                                this effort would be a procfs parsing
                                library. Since different platforms would
                                probably have different monitoring
                                requirements and procfs output format
                                has no standard, I'm thinking the user
                                would just provide a configuration file
                                containing list of (procfs path,
                                property regex, D-Bus property name),
                                and the compile-time generated code to
                                provide an object for each property. </p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">All of this is merely
                                thoughts and nothing concrete. With that
                                said, it would be really great if you
                                could provide some feedback such as "I
                                want this, but I really need that
                                feature", or let me know it's all
                                implemented already :)</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <div>
                              <p class="MsoNormal">If this seems
                                valuable, after gathering more feedback
                                of feature requirements, I'm going to
                                turn them into design docs and upload
                                for review.</p>
                            </div>
                            <div>
                              <p class="MsoNormal"> </p>
                            </div>
                            <p class="MsoNormal">-- </p>
                            <div>
                              <div>
                                <p class="MsoNormal">Regards, </p>
                                <div>
                                  <p class="MsoNormal">Kun</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr">Regards,
          <div>Kun</div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------4A3C6FE3BD513DAC456F781D--

