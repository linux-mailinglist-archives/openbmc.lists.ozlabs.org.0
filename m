Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBA1182F6
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 10:00:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XDYj2rXQzDqY2
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 20:00:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XDXd23VfzDqVK
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 20:00:00 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA8vIn2121609
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 03:59:57 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wskq7n2a0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 03:59:56 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 10 Dec 2019 08:59:54 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 08:59:51 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA8xmrt51970258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 08:59:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09E5742047;
 Tue, 10 Dec 2019 08:59:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C94C342045;
 Tue, 10 Dec 2019 08:59:46 +0000 (GMT)
Received: from [9.122.210.233] (unknown [9.122.210.233])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 08:59:46 +0000 (GMT)
Subject: Re: Managing heterogeneous systems
To: Richard Hanley <rhanley@google.com>, Neeraj Ladkani <neladk@microsoft.com>
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 10 Dec 2019 14:29:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------AE01C283D58AB893571747ED"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19121008-0028-0000-0000-000003C72164
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121008-0029-0000-0000-0000248A4FE0
Message-Id: <cb3fe45e-72b8-9910-9dda-b9127bf74fdc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100081
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
Cc: sgundura@in.ibm.com, shahjsha@in.ibm.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, vikantan@in.ibm.com,
 kusripat@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------AE01C283D58AB893571747ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard / Neeraj,

Thanks for bringing this up. It's one of the interesting topic for IBM.

Some of the thoughts here.....

When we have multiple BMCs as part of a single system, then there are 3 
main parts into it.

1/. Discovering the peer BMCs and role assignment
2/. Monitoring the existence of peer BMCs - heartbeat
3/. In the event of loosing the master, detect so using #2 and then 
reassign the role

Depending on how we want to establish the roles, we could have 
Single-Master, Many-slave or Multi-Master, Multi-Slave. etc

One of the team here is trying to do a POC for Multi BMC architecture 
and is still in the very beginning stage.
The team is currently studying/evaluating the available solution - 
Corosync / Heartbeat / Pacemaker".
Corosync works nice with the clusters, but we need to see if we can trim 
it down for BMC.

If we can not use corosync for some reason, then need to see if we can 
use the discovery using PLDM ( probably use the terminus IDs )
and come up with custom rules for assigning Master-Slave roles.

If we choose to have Single-Master and Many-Slave, we could have that 
Single-Master as an entity acting as a Point of Contact for external 
request and then could orchestrate with the needed BMCs internally to 
get the job done

I will be happy to know if there are alternatives that suit BMC kind of 
an architecture

!! Vishwa !!

On 12/10/19 4:32 AM, Richard Hanley wrote:
> Hi Neeraj,
>
> This is an open question that I've been looking into as well.
>
> For BMC to BMC communication there are a few options.
>
>  1. If you have network connectivity you can communicate using Redfish.
>  2. If you only have a PCIe connection, you'll have to use either the
>     inband connection or the side band I2C*.  PLDM and MCTP are
>     protocols that defined to handle this use case, although I'm not
>     sure if the OpenBMC implementations have been used in production.
>  3. There is always IPMI, which has its own pros/cons.
>
> For taking several BMCs and aggregating them into a single logical 
> interface that is exposed to the outside world, there are a few things 
> happening on that front.  DMTF has been working on an aggregation 
> protocol for Redfish. However, it's my understanding that their 
> proposal is more directed at the client level, as opposed to within a 
> single "system".
>
> I just recently joined the community, but I've been thinking about how 
> a proxy layer could merge two Redfish services together.  Since 
> Redfish is fairly strongly typed and has a well defined mechanism for 
> OEM extensions, this should be pretty generally applicable.  I am 
> planning on having a white paper on the issue sometime after the holidays.
>
> Another thing to note, recently DMTF released a spec for running a 
> binary Redfish over PLDM called RDE.  That might be a useful way of 
> tying all these concepts together.
>
> I'd be curious about your thoughts and use cases here. Would either 
> PLDM or Redfish fit your use case?
>
> Regards,
> Richard
>
> *I've heard of some proposals that run a network interface over PCIe.  
> I don't know enough about PCIe to know if this is a good idea.
>
> On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani <neladk@microsoft.com 
> <mailto:neladk@microsoft.com>> wrote:
>
>     Are there any standards in managing heterogeneous systems? For
>     example in a rack if there is a compute node( with its own BMC)
>     and storage node( with its own BMC) connected using a PCIe
>     switch.  How these two BMC represented as one system ?  are there
>     any standards for BMC – BMC communication?
>
>     Neeraj
>

--------------AE01C283D58AB893571747ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Richard / Neeraj,</p>
    <p>Thanks for bringing this up. It's one of the interesting topic
      for IBM.</p>
    <p>Some of the thoughts here.....<br>
    </p>
    <p>When we have multiple BMCs as part of a single system, then there
      are 3 main parts into it.</p>
    <p>1/. Discovering the peer BMCs and role assignment<br>
      2/. Monitoring the existence of peer BMCs - heartbeat <br>
      3/. In the event of loosing the master, detect so using #2 and
      then reassign the role<br>
    </p>
    <p>Depending on how we want to establish the roles, we could have
      Single-Master, Many-slave or Multi-Master, Multi-Slave. etc<br>
    </p>
    <p>One of the team here is trying to do a POC for Multi BMC
      architecture and is still in the very beginning stage. <br>
      The team is currently studying/evaluating the available solution -
      Corosync / Heartbeat / Pacemaker".<br>
      Corosync works nice with the clusters, but we need to see if we
      can trim it down for BMC.<br>
      <br>
      If we can not use corosync for some reason, then need to see if we
      can use the discovery using PLDM ( probably use the terminus IDs )<br>
      and come up with custom rules for assigning Master-Slave roles.<br>
    </p>
    <p>If we choose to have Single-Master and Many-Slave, we could have
      that Single-Master as an entity acting as a Point of Contact for
      external request and then could orchestrate with the needed BMCs
      internally to get the job done<br>
    </p>
    <p>I will be happy to know if there are alternatives that suit BMC
      kind of an architecture</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 12/10/19 4:32 AM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Neeraj,
        <div><br>
        </div>
        <div>This is an open question that I've been looking into as
          well.  </div>
        <div><br>
        </div>
        <div>For BMC to BMC communication there are a few options.</div>
        <div>
          <ol>
            <li>If you have network connectivity you can communicate
              using Redfish.</li>
            <li>If you only have a PCIe connection, you'll have to use
              either the inband connection or the side band I2C*.  PLDM
              and MCTP are protocols that defined to handle this use
              case, although I'm not sure if the OpenBMC implementations
              have been used in production.</li>
            <li>There is always IPMI, which has its own pros/cons.</li>
          </ol>
          <div>For taking several BMCs and aggregating them into a
            single logical interface that is exposed to the outside
            world, there are a few things happening on that front.  DMTF
            has been working on an aggregation protocol for Redfish. 
            However, it's my understanding that their proposal is more
            directed at the client level, as opposed to within a single
            "system".</div>
        </div>
        <div><br>
        </div>
        <div>I just recently joined the community, but I've been
          thinking about how a proxy layer could merge two Redfish
          services together.  Since Redfish is fairly strongly typed and
          has a well defined mechanism for OEM extensions, this should
          be pretty generally applicable.  I am planning on having a
          white paper on the issue sometime after the holidays.</div>
        <div><br>
        </div>
        <div>Another thing to note, recently DMTF released a spec for
          running a binary Redfish over PLDM called RDE.  That might be
          a useful way of tying all these concepts together.  </div>
        <div><br>
        </div>
        <div>I'd be curious about your thoughts and use cases here. 
          Would either PLDM or Redfish fit your use case?</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Richard</div>
        <div><br>
        </div>
        <div>*I've heard of some proposals that run a network interface
          over PCIe.  I don't know enough about PCIe to know if this is
          a good idea.</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, Dec 9, 2019 at 1:27 PM
          Neeraj Ladkani &lt;<a href="mailto:neladk@microsoft.com"
            target="_blank" moz-do-not-send="true">neladk@microsoft.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div lang="EN-US">
            <div>
              <p class="MsoNormal">Are there any standards in managing
                heterogeneous systems? For example in a rack if there is
                a compute node( with its own BMC) and storage node( with
                its own BMC) connected using a PCIe switch.  How these
                two BMC represented as one system ?  are there any
                standards for BMC – BMC communication? </p>
              <p class="MsoNormal"> </p>
              <p class="MsoNormal"> </p>
              <p class="MsoNormal">Neeraj</p>
              <p class="MsoNormal"> </p>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------AE01C283D58AB893571747ED--

