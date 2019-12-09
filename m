Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C019B116956
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 10:31:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WdHM69k7zDqQQ
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 20:31:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WdGQ2mpQzDqPG
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 20:30:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB99UQO2093931
 for <openbmc@lists.ozlabs.org>; Mon, 9 Dec 2019 04:30:32 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrt7k1vej-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 04:30:29 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 9 Dec 2019 09:30:23 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 09:30:22 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB99ULqe24576106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 9 Dec 2019 09:30:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 703714204B
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 09:30:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E5842041
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 09:30:21 +0000 (GMT)
Received: from [9.122.210.117] (unknown [9.122.210.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 09:30:20 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: *Request For Feedback*: TimeOwner in phosphor-timemanager
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 9 Dec 2019 15:00:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------76977E34D321C5D3FC6C41F0"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19120909-0028-0000-0000-000003C6C81F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120909-0029-0000-0000-00002489F2A0
Message-Id: <18332622-cec4-37ae-b617-b897622d0ea2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090082
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
--------------76977E34D321C5D3FC6C41F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

Sending this email requesting the feedback on the usage/need of 
"TimeOwner" that is part of phosphor-timemanager.

phosphor-timemanager is a time keeping daemon on the BMC that uses BMC's 
RTC to hold the time. It uses systemd-timesyncd and systemd-timedated.

There are 2 D-Bus objects that implement 
"phosphor-dbus-interfaces/xyz/openbmc_project/Time/EpochTime.interface.yaml" 
and is managed by a common manager.

/xyz/openbmc_projects/time/bmc  : Used when the request is coming in via 
Redfish
/xyz/openbmc_projects/time/host : Used when the request is inband with 
IPMI_SET_SEL_TIME and IPMI_GET_SEL_TIME + PLDM ones.

timemanager consumes 2 settings, namely, TimeSyncMethod and TimeOwner 
defined in phosphor-dbus-interfaces/xyz/openbmc_project/Time/.

TimeSyncMethod: Indicates whether the NTP must be used or should it be 
settable by the user.
                 For example: If the time set request comes and the 
Method was set to NTP, then the write request would be ignored.

TimeOwner: This is where we have seen the community telling why do we 
even have such a thing. Talking to the UX team, looks like, the 
customers have had difficulty understanding this.

There are 4 values for TimeOwners: ( Works irrespective of acting on 
time/bmc or time/host D-Bus objects )

/BMC : BMC is the owner of the time. So, Host *can not *set the time on 
BMC. Inband SET_SEL_TIME would result in error.//
//
//HOST: Host is the owner of the time. So, only the host *can set* the 
time on BMC. Any external Redfish SET requests would result in error/

/SPLIT: This is where we could achieve independent times for BMC and 
Host. This is a combination of BMC + HOST. Both BMC and HOST can set
        the time. Host time is maintained as an offset into BMC's time. 
So, whenever the Host sends the time request, the offset is
        factored into//BMC's time and then the response would be returned.//
//
//BOTH : BMC and/or HOST can SET the time. Whoever did SET it last, will 
be maintained.
/

Personally, I have worked on github issue from Redhat when there were 
failures setting the time from OS using "hwclock" since the Owner was 
set to [BMC]. The solution was to [poweroff] the system, change the 
Owner to [HOST/SPLIT] and boot back.

Note: Since these policies are user settable, they can be changed at 
anytime. However, they will not be taken into account until the system 
is booted again.

*Why did we even have this ?*: During the initial development of 
timemanager, the thought was that, Host would not trust the BMC and 
hence we want a way where BMC and Host can maintain their own time

*Do we need this going forward ?*: I am being asked by UX team about the 
need of this and I mentioned I would get the community feedback on this. 
Although, I feel this level of granularity gives control over how we can 
manage time, it would not justify the complexity if the customers don't 
appreciate it. Removing the TimeOwner would make the code a lot simpler.

Please help with your votes.

Thank you,

!! Vishwa !!


--------------76977E34D321C5D3FC6C41F0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi All,</p>
    <p>Sending this email requesting the feedback on the usage/need of
      "TimeOwner" that is part of phosphor-timemanager.</p>
    <p>phosphor-timemanager is a time keeping daemon on the BMC that
      uses BMC's RTC to hold the time. It uses systemd-timesyncd and
      systemd-timedated.<br>
    </p>
    <p>There are 2 D-Bus objects that implement
"phosphor-dbus-interfaces/xyz/openbmc_project/Time/EpochTime.interface.yaml"
      and is managed by a common manager.<br>
    </p>
    <p>/xyz/openbmc_projects/time/bmc  : Used when the request is coming
      in via Redfish<br>
      /xyz/openbmc_projects/time/host : Used when the request is inband
      with IPMI_SET_SEL_TIME and IPMI_GET_SEL_TIME + PLDM ones.<br>
    </p>
    <p>timemanager consumes 2 settings, namely, TimeSyncMethod and
      TimeOwner defined in
      phosphor-dbus-interfaces/xyz/openbmc_project/Time/.</p>
    <p>TimeSyncMethod: Indicates whether the NTP must be used or should
      it be settable by the user.<br>
                      For example: If the time set request comes and the
      Method was set to NTP, then the write request would be ignored.<br>
    </p>
    <p>TimeOwner: This is where we have seen the community telling why
      do we even have such a thing. Talking to the UX team, looks like,
      the customers have had difficulty understanding this.</p>
    <p>There are 4 values for TimeOwners: ( Works irrespective of acting
      on time/bmc or time/host D-Bus objects )</p>
    <p><font color="#3366ff"><i>BMC : BMC is the owner of the time. So,
          Host <b>can not </b>set the time on BMC. Inband SET_SEL_TIME
          would result in error.</i><i><br>
        </i><i><br>
        </i><font color="#ff6666"><i>HOST: Host is the owner of the
            time. So, only the host <b>can set</b> the time on BMC. Any
            external Redfish SET requests would result in error</i></font></font></p>
    <p><font color="#3366ff"><i>SPLIT: This is where we could achieve
          independent times for BMC and Host. This is a combination of
          BMC + HOST. Both BMC and HOST can set<br>
                 the time. Host time is maintained as an offset into
          BMC's time. So, whenever the Host sends the time request, the
          offset is<br>
                 factored into</i><i> BMC's time and then the response
          would be returned.</i><i><br>
        </i><i><br>
        </i><font color="#ff6600"><i>BOTH : BMC and/or HOST can SET the
            time. Whoever did SET it last, will be maintained.<br>
          </i></font></font></p>
    <p>Personally, I have worked on github issue from Redhat when there
      were failures setting the time from OS using "hwclock" since the
      Owner was set to [BMC]. The solution was to [poweroff] the system,
      change the Owner to [HOST/SPLIT] and boot back.</p>
    <p>Note: Since these policies are user settable, they can be changed
      at anytime. However, they will not be taken into account until the
      system is booted again.</p>
    <p><b>Why did we even have this ?</b>: During the initial
      development of timemanager, the thought was that, Host would not
      trust the BMC and hence we want a way where BMC and Host can
      maintain their own time</p>
    <p><b>Do we need this going forward ?</b>: I am being asked by UX
      team about the need of this and I mentioned I would get the
      community feedback on this. Although, I feel this level of
      granularity gives control over how we can manage time, it would
      not justify the complexity if the customers don't appreciate it.
      Removing the TimeOwner would make the code a lot simpler.<br>
    </p>
    <p>Please help with your votes.</p>
    <p>Thank you,</p>
    <p>!! Vishwa !!<br>
    </p>
  </body>
</html>

--------------76977E34D321C5D3FC6C41F0--

