Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB072B598
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 14:43:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CGq62lfrzDqKj
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 22:43:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CGpP1941zDq6K
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 22:42:36 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCc1W5117975
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 08:42:32 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2srfygrjn2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 08:42:32 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 27 May 2019 13:42:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 May 2019 13:42:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4RCgQu063176922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 May 2019 12:42:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A078F11C04C;
 Mon, 27 May 2019 12:42:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 951A711C050;
 Mon, 27 May 2019 12:42:25 +0000 (GMT)
Received: from [9.122.210.24] (unknown [9.122.210.24])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 May 2019 12:42:25 +0000 (GMT)
Subject: Re: Add support to debug unresponsive host
To: Jayanth Othayoth <ojayanth@gmail.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
 <c8826cab-42d1-85d7-4eb0-50e79857a205@linux.vnet.ibm.com>
 <CALLMt=q+PHM09zDeM5hBGRm7sTmPF42QSo6fYB=CmL5DHP_rKg@mail.gmail.com>
 <CACkAXSpuVmMWXwzPxBYrw4ZUpKHAgw_KtKboR6iVGyEuyWpVcg@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 27 May 2019 18:12:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACkAXSpuVmMWXwzPxBYrw4ZUpKHAgw_KtKboR6iVGyEuyWpVcg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E4370388899E450753732378"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052712-0028-0000-0000-00000371EA24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052712-0029-0000-0000-00002431A6C1
Message-Id: <90d9c249-56d3-b27e-f44b-1624c2615b85@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905270089
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com,
 artemsen@gmail.com, yugang.chen@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E4370388899E450753732378
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I kind of remember this topic being talked about in the past. Looks like 
we need to do 2 things prior to calling SRESET. I will comment the review.

!! Vishwa !!

On 5/27/19 12:45 PM, Jayanth Othayoth wrote:
> Design template Review is available here
>
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21772
>
> On Thu, May 16, 2019 at 6:31 PM Andrew Geissler <geissonator@gmail.com 
> <mailto:geissonator@gmail.com>> wrote:
>
>     On Thu, May 16, 2019 at 1:36 AM Deepak Kodihalli
>     <dkodihal@linux.vnet.ibm.com <mailto:dkodihal@linux.vnet.ibm.com>>
>     wrote:
>     >
>     > On 15/05/19 6:09 PM, Jayanth Othayoth wrote:
>     > > ## Problem Description
>     > > Issue #457:  Add support to debug unresponsive host.
>     > >
>     > > Scope: High level design direction to solve this problem,
>     > >
>     > > ## Background and References
>     > > There are situation at customer places where OPAL/Linux goes
>     > > unresponsive causing a system hang. And there is no way to
>     figure out
>     > > what went wrong with Linux kernel or OPAL. Looking for a way
>     to trigger
>     > > a dump capture on Linux host so that we can capture the OS
>     dump for post
>     > > analysis.
>     > >
>     > > ## Proposed Design for POWER processor based systems:
>     > > Get all Host CPUs in reset vector and Linux then has a
>     mechanism to
>     > > patch it into panic-kdump path to trigger dump capture. This
>     will enable
>     > > us to analyze and fix customer issue where we see Linux hang and
>     > > unresponsive system.
>     > >
>     > > ### Redfish Schema used:
>     > > * Reference: DSP2046 2018.3,
>     > > * ComputerSystem 1.6.0 schema provides an action called
>     > > #ComputerSystem.Reset”, This action is used to reset the system.
>     > > ResetType parameter is used  for indicating type of reset need
>     to be
>     > > performed. In this use case we can use “Nmi” type
>     > >      * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86
>     > > systems) to cease normal operations, perform diagnostic
>     actions and
>     > > typically halt the system.
>     > > * ### d-bus :
>     > >
>     > > Option 1:   Extending  the existing  d-bus interface 
>     state.Host  name
>     > > space (
>     > >
>     /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interface.yaml
>     > > ) to support new RequestedHostTransition property called 
>     “Nmi”.   d-bus
>     > > backend can internally invoke processor specific target to do
>     Sreset(
>     > > equivalent to x86 NMI) and associated  actions.
>     >
>     > I don't prefer this option, because this would mean adding host
>     specific
>     > code in phoshor-state-manager, which I think until now is host
>     agnostic.
>
>     Yeah, this was my main concern with tying it into
>     phosphor-state-manager.
>     The fact Redfish put it in with their other state related commands
>     (which
>     are implemented by phosphor-state-manager) is the only reason I'm
>     a little
>     wishy-washy here. We could just create a generic systemd target
>     "host-nmi"
>     or something and phosphor-state-manager could just call that to
>     abstract
>     any of the specifics, but it sill doesn't really feel like it fits
>     to me.
>
>     I think I prefer option 2, and then we can just map bmcweb to that
>     API when
>     the Redfish command comes in. Sounds like for ppc64 systems we can
>     just
>     use pdbg to issue the NMI.
>
>     > So for that reason, Option 2 sounds better. There are some good
>     > questions from Neeraj as well, so I would suggest adding this as a
>     > design template on Gerrit to gather better feedback.
>     >
>     > Thanks,
>     > Deepak
>     >
>     > > Option 2: Introducing new d-bus interface in the control.state
>     namespace
>     > > (
>     > >
>     /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.interface.yaml)
>     > > namespace and implement the new d-bus back-end for respective 
>     processor
>     > > specific targets.
>     >
>

--------------E4370388899E450753732378
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I kind of remember this topic being talked about in the past.
      Looks like we need to do 2 things prior to calling SRESET. I will
      comment the review.
    </p>
    <p>!! Vishwa !!</p>
    <div class="moz-cite-prefix">On 5/27/19 12:45 PM, Jayanth Othayoth
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACkAXSpuVmMWXwzPxBYrw4ZUpKHAgw_KtKboR6iVGyEuyWpVcg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Design template Review is available here<br>
        </div>
        <div><br>
        </div>
        <div><a
            href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21772"
            target="_blank" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21772</a></div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, May 16, 2019 at 6:31
          PM Andrew Geissler &lt;<a href="mailto:geissonator@gmail.com"
            target="_blank" moz-do-not-send="true">geissonator@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Thu, May 16, 2019 at 1:36 AM Deepak Kodihalli<br>
          &lt;<a href="mailto:dkodihal@linux.vnet.ibm.com"
            target="_blank" moz-do-not-send="true">dkodihal@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
          &gt;<br>
          &gt; On 15/05/19 6:09 PM, Jayanth Othayoth wrote:<br>
          &gt; &gt; ## Problem Description<br>
          &gt; &gt; Issue #457:  Add support to debug unresponsive host.<br>
          &gt; &gt;<br>
          &gt; &gt; Scope: High level design direction to solve this
          problem,<br>
          &gt; &gt;<br>
          &gt; &gt; ## Background and References<br>
          &gt; &gt; There are situation at customer places where
          OPAL/Linux goes<br>
          &gt; &gt; unresponsive causing a system hang. And there is no
          way to figure out<br>
          &gt; &gt; what went wrong with Linux kernel or OPAL. Looking
          for a way to trigger<br>
          &gt; &gt; a dump capture on Linux host so that we can capture
          the OS dump for post<br>
          &gt; &gt; analysis.<br>
          &gt; &gt;<br>
          &gt; &gt; ## Proposed Design for POWER processor based
          systems:<br>
          &gt; &gt; Get all Host CPUs in reset vector and Linux then has
          a mechanism to<br>
          &gt; &gt; patch it into panic-kdump path to trigger dump
          capture. This will enable<br>
          &gt; &gt; us to analyze and fix customer issue where we see
          Linux hang and<br>
          &gt; &gt; unresponsive system.<br>
          &gt; &gt;<br>
          &gt; &gt; ### Redfish Schema used:<br>
          &gt; &gt; * Reference: DSP2046 2018.3,<br>
          &gt; &gt; * ComputerSystem 1.6.0 schema provides an action
          called<br>
          &gt; &gt; #ComputerSystem.Reset”, This action is used to reset
          the system.<br>
          &gt; &gt; ResetType parameter is used  for indicating type of
          reset need to be<br>
          &gt; &gt; performed. In this use case we can use “Nmi” type<br>
          &gt; &gt;      * Nmi: Generate a Diagnostic Interrupt (usually
          an NMI on x86<br>
          &gt; &gt; systems) to cease normal operations, perform
          diagnostic actions and<br>
          &gt; &gt; typically halt the system.<br>
          &gt; &gt; * ### d-bus :<br>
          &gt; &gt;<br>
          &gt; &gt; Option 1:   Extending  the existing  d-bus
          interface  state.Host  name<br>
          &gt; &gt; space (<br>
          &gt; &gt;
/openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interface.yaml<br>
          &gt; &gt; ) to support new RequestedHostTransition property
          called  “Nmi”.   d-bus<br>
          &gt; &gt; backend can internally invoke processor specific
          target to do Sreset(<br>
          &gt; &gt; equivalent to x86 NMI) and associated  actions.<br>
          &gt;<br>
          &gt; I don't prefer this option, because this would mean
          adding host specific<br>
          &gt; code in phoshor-state-manager, which I think until now is
          host agnostic.<br>
          <br>
          Yeah, this was my main concern with tying it into
          phosphor-state-manager.<br>
          The fact Redfish put it in with their other state related
          commands (which<br>
          are implemented by phosphor-state-manager) is the only reason
          I'm a little<br>
          wishy-washy here. We could just create a generic systemd
          target "host-nmi"<br>
          or something and phosphor-state-manager could just call that
          to abstract<br>
          any of the specifics, but it sill doesn't really feel like it
          fits to me.<br>
          <br>
          I think I prefer option 2, and then we can just map bmcweb to
          that API when<br>
          the Redfish command comes in. Sounds like for ppc64 systems we
          can just<br>
          use pdbg to issue the NMI.<br>
          <br>
          &gt; So for that reason, Option 2 sounds better. There are
          some good<br>
          &gt; questions from Neeraj as well, so I would suggest adding
          this as a<br>
          &gt; design template on Gerrit to gather better feedback.<br>
          &gt;<br>
          &gt; Thanks,<br>
          &gt; Deepak<br>
          &gt;<br>
          &gt; &gt; Option 2: Introducing new d-bus interface in the
          control.state namespace<br>
          &gt; &gt; (<br>
          &gt; &gt;
/openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.interface.yaml)<br>
          &gt; &gt; namespace and implement the new d-bus back-end for
          respective  processor<br>
          &gt; &gt; specific targets.<br>
          &gt;<br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------E4370388899E450753732378--

