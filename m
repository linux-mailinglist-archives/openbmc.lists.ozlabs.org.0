Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D59BA1C3B66
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 15:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G3qm16WmzDqYJ
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 23:39:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G3pg5f9dzDqY1
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 23:38:35 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 044DYbBu181887; Mon, 4 May 2020 09:38:30 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s316w052-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 09:38:30 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 044DUc10013690;
 Mon, 4 May 2020 13:38:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 30s0g5hybs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 13:38:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 044DbGkg66454014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 13:37:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 010FA4C044;
 Mon,  4 May 2020 13:38:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3265A4C046;
 Mon,  4 May 2020 13:38:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.190.93])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 13:38:24 +0000 (GMT)
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Johnathan Mantey <johnathanx.mantey@intel.com>, openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
 <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
 <7c9a2b08-1224-9828-9175-41566532602a@intel.com>
 <1f8f6dd4-c62e-7165-c1ba-7466e407d594@linux.vnet.ibm.com>
 <35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <d523bbb9-59a4-4b15-6527-68f842c0f3ec@linux.vnet.ibm.com>
Date: Mon, 4 May 2020 19:08:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com>
Content-Type: multipart/alternative;
 boundary="------------C4E630BCD9B4078E7C068B99"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_07:2020-05-04,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040111
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
--------------C4E630BCD9B4078E7C068B99
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/29/20 12:19 AM, Johnathan Mantey wrote:
> I think I understand most of your plan.
>
> What does it mean to "use the default metric"?

https://support.microsoft.com/en-in/help/299540/an-explanation-of-the-automatic-metric-feature-for-ipv4-routes

Instead of user level application assigns the metric value, Let the 
kernel decide which gateway should be used.

I understand that there should be a way through which we should be able 
to change the metric value  but that can be implemented later with some 
thing like route management where user should be able to add 
HostRoutes/Network routes etc, chnaging the values of the routes etc.

>
> On 4/28/20 8:16 AM, Ratan Gupta wrote:
>>
>> Hi Jonathan,
>>
>> On 4/28/20 1:00 AM, Johnathan Mantey wrote:
>>> Ratan,
>>>
>>> Can you provide more info about how you plan to implement this?
>> I am not getting, Do you mean to say how to get the per interface 
>> gateway from system?  that would be through netlink, and during 
>> configuration we would use the systemd-networkd file configuration.
>>>
>>> The Redfish schemas already have a per IP addr Gateway entry, which 
>>> OBMC is ignoring. Is it better to modify the existing D-Bus schema 
>>> (i.e. versioning discussion), or just use what is presently in 
>>> existence?
>> Redfish schema are getting changed to accommodate this through the 
>> following issue https://github.com/DMTF/Redfish/issues/3609.
>>
>> The above issue(gateway/interface) exist only for the IPv4 redfish 
>> schema, IPv6 redfish is already having default gateway per interface
>>
>> http://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_5_1.json#/definitions/EthernetInterface
>>
>>>
>>> That said, doing as you propose melds better with how IPMI (i.e Set 
>>> LAN Configuration Parameter 12) works.
>>>
>>> As Patrick pointed out, there's no IPMI or Redfish control over the 
>>> routing metric parameter. What are your thoughts on how to reconcile 
>>> applying a metric value?
>> We will go with default metric value as today as underlying stack 
>> tries for fallback gateway.
>>> I've long been desirous of getting Williams submission merged: 
>>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/20799
>>> as it can be used to improve the collection of netlink stats.
>>>
>>> Redfish exacerbates this whole problem by allowing a collection of 
>>> static IP addresses (and a DHCP addr) per NIC, unlike IPMI which was 
>>> very one to one with IP addr/NIC.
>>>
>>> Thanks for investigating this and working to implement a solution.
>>>
>>> On 4/27/20 4:11 AM, Ratan Gupta wrote:
>>>>
>>>> Thanks Patrick, William for sharing the feedbacks
>>>>
>>>> I will start working on the changes.
>>>>
>>>>
>>>> On 4/24/20 11:15 PM, William Kennington wrote:
>>>>> Sounds good to me, we have needed this for a long time because the 
>>>>> current gateway configuration breaks our v6 stack with multiple NICs.
>>>>>
>>>>> On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams 
>>>>> <patrick@stwcx.xyz <mailto:patrick@stwcx.xyz>> wrote:
>>>>>
>>>>>     On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
>>>>>     > ~~~~~~~~~~~~~
>>>>>     > Kernel IP routing table
>>>>>     > Destination     Gateway         Genmask Flags   MSS Window 
>>>>>     irtt
>>>>>     > Iface
>>>>>     > 0.0.0.0         19.168.2.1      0.0.0.0 UG        0
>>>>>     0          0
>>>>>     > eth0
>>>>>     > 0.0.0.0         10.10.10.1      0.0.0.0 UG        0
>>>>>     0          0
>>>>>     > eth1
>>>>>     > ~~~~~~~~~~~~~~
>>>>>     >
>>>>>     > Kernel will first try using the default gateway having
>>>>>     higher metric
>>>>>     > value and then fall back to the lower.
>>>>>
>>>>>     I'm not seeing us with an interface to adjust the metric for an
>>>>>     interface.  I think we need to add that at the same time?
>>>>>
>>>> Not now, As per my testing if metric value is not defined and both 
>>>> the routes
>>>>
>>>> having same metric then kernel tries one after other. We can bring 
>>>> the metric
>>>>
>>>> later.
>>>>
>>>>>       Otherwise, I
>>>>>     don't think we have a way to specify which interface
>>>>>     outside-the-subnet
>>>>>     should go (vs today we can set the default-gateway to the desired
>>>>>     interface's gateway).
>>>>>     -- 
>>>>>     Patrick Williams
>>>>>
>>>
>>> -- 
>>> Johnathan Mantey
>>> Senior Software Engineer
>>> *azad te**chnology partners*
>>> Contributing to Technology Innovation since 1992
>>> Phone: (503) 712-6764
>>> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
>>
>> Ratan
>>
>
> -- 
> Johnathan Mantey
> Senior Software Engineer
> *azad te**chnology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>
>

--------------C4E630BCD9B4078E7C068B99
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/29/20 12:19 AM, Johnathan Mantey
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      I think I understand most of your plan.<br>
      <br>
      What does it mean to "use the default metric"?<br>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://support.microsoft.com/en-in/help/299540/an-explanation-of-the-automatic-metric-feature-for-ipv4-routes">https://support.microsoft.com/en-in/help/299540/an-explanation-of-the-automatic-metric-feature-for-ipv4-routes</a></p>
    <p>Instead of user level application assigns the metric value, Let
      the kernel decide which gateway should be used.</p>
    <p>I understand that there should be a way through which we should
      be able to change the metric value  but that can be implemented
      later with some thing like route management where user should be
      able to add HostRoutes/Network routes etc, chnaging the values of
      the routes etc. <br>
    </p>
    <blockquote type="cite"
      cite="mid:35251645-af06-5ab5-9e1b-8e6eaa44f650@intel.com"> <br>
      <div class="moz-cite-prefix">On 4/28/20 8:16 AM, Ratan Gupta
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:1f8f6dd4-c62e-7165-c1ba-7466e407d594@linux.vnet.ibm.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p>Hi Jonathan,</p>
        <div class="moz-cite-prefix">On 4/28/20 1:00 AM, Johnathan
          Mantey wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com">
          Ratan,<br>
          <br>
          Can you provide more info about how you plan to implement
          this?<br>
        </blockquote>
        I am not getting, Do you mean to say how to get the per
        interface gateway from system?  that would be through netlink,
        and during configuration we would use the systemd-networkd file
        configuration.<br>
        <blockquote type="cite"
          cite="mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com"> <br>
          The Redfish schemas already have a per IP addr Gateway entry,
          which OBMC is ignoring. Is it better to modify the existing
          D-Bus schema (i.e. versioning discussion), or just use what is
          presently in existence?<br>
        </blockquote>
        Redfish schema are getting changed to accommodate this through
        the following issue <a class="moz-txt-link-freetext"
          href="https://github.com/DMTF/Redfish/issues/3609"
          moz-do-not-send="true">https://github.com/DMTF/Redfish/issues/3609</a>.<br>
        <p>The above issue(gateway/interface) exist only for the IPv4
          redfish schema, IPv6 redfish is already having default gateway
          per interface <br>
        </p>
        <p><a class="moz-txt-link-freetext"
href="http://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_5_1.json#/definitions/EthernetInterface"
            moz-do-not-send="true">http://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_5_1.json#/definitions/EthernetInterface</a><br>
        </p>
        <blockquote type="cite"
          cite="mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com"> <br>
          That said, doing as you propose melds better with how IPMI
          (i.e Set LAN Configuration Parameter 12) works.<br>
          <br>
          As Patrick pointed out, there's no IPMI or Redfish control
          over the routing metric parameter. What are your thoughts on
          how to reconcile applying a metric value?<br>
        </blockquote>
        We will go with default metric value as today as underlying
        stack tries for fallback gateway.
        <blockquote type="cite"
          cite="mid:7c9a2b08-1224-9828-9175-41566532602a@intel.com">
          I've long been desirous of getting Williams submission merged:
          <a class="moz-txt-link-freetext"
href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/20799"
            moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/20799</a><br>
          as it can be used to improve the collection of netlink stats.<br>
          <br>
          Redfish exacerbates this whole problem by allowing a
          collection of static IP addresses (and a DHCP addr) per NIC,
          unlike IPMI which was very one to one with IP addr/NIC. <br>
          <br>
          Thanks for investigating this and working to implement a
          solution.<br>
          <br>
          <div class="moz-cite-prefix">On 4/27/20 4:11 AM, Ratan Gupta
            wrote:<br>
          </div>
          <blockquote type="cite"
            cite="mid:32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com">
            <p>Thanks Patrick, William for sharing the feedbacks<br>
            </p>
            <p>I will start working on the changes.<br>
            </p>
            <p><br>
            </p>
            <div class="moz-cite-prefix">On 4/24/20 11:15 PM, William
              Kennington wrote:<br>
            </div>
            <blockquote type="cite"
cite="mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com">
              <div dir="ltr">Sounds good to me, we have needed this for
                a long time because the current gateway configuration
                breaks our v6 stack with multiple NICs.<br>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Fri, Apr 24, 2020
                  at 8:21 AM Patrick Williams &lt;<a
                    href="mailto:patrick@stwcx.xyz"
                    moz-do-not-send="true">patrick@stwcx.xyz</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">On Fri, Apr 24,
                  2020 at 08:36:26PM +0530, Ratan Gupta wrote:<br>
                  &gt; ~~~~~~~~~~~~~<br>
                  &gt; Kernel IP routing table<br>
                  &gt; Destination     Gateway         Genmask        
                  Flags   MSS Window  irtt <br>
                  &gt; Iface<br>
                  &gt; 0.0.0.0         19.168.2.1      0.0.0.0        
                  UG        0 0          0 <br>
                  &gt; eth0<br>
                  &gt; 0.0.0.0         10.10.10.1      0.0.0.0        
                  UG        0 0          0 <br>
                  &gt; eth1<br>
                  &gt; ~~~~~~~~~~~~~~<br>
                  &gt; <br>
                  &gt; Kernel will first try using the default gateway
                  having higher metric <br>
                  &gt; value and then fall back to the lower.<br>
                  <br>
                  I'm not seeing us with an interface to adjust the
                  metric for an<br>
                  interface.  I think we need to add that at the same
                  time?</blockquote>
              </div>
            </blockquote>
            <p>Not now, As per my testing if metric value is not defined
              and both the routes</p>
            <p>having same metric then kernel tries one after other. We
              can bring the metric</p>
            <p>later.<br>
            </p>
            <blockquote type="cite"
cite="mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com">
              <div class="gmail_quote">
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">  Otherwise, I<br>
                  don't think we have a way to specify which interface
                  outside-the-subnet<br>
                  should go (vs today we can set the default-gateway to
                  the desired<br>
                  interface's gateway).<br>
                  -- <br>
                  Patrick Williams<br>
                </blockquote>
              </div>
            </blockquote>
          </blockquote>
          <br>
          <div class="moz-signature">-- <br>
            <title></title>
            <font color="#1F497D"><font face="Century Gothic">Johnathan
                Mantey<br>
                <small>Senior Software Engineer</small><br>
                <big><font color="#555555"><small><b>azad te</b><b>chnology
                        partners</b></small><br>
                    <small><font color="#1F497D"><small>Contributing to
                          Technology Innovation since 1992</small></font><small><br>
                        <font color="#1F497D">Phone: (503) 712-6764<br>
                          Email: <a
                            href="mailto:johnathanx.mantey@intel.com"
                            moz-do-not-send="true">johnathanx.mantey@intel.com</a></font></small><br>
                    </small></font></big></font></font></div>
        </blockquote>
        <p><font color="#1F497D"><font face="Century Gothic">Ratan</font></font></p>
      </blockquote>
      <br>
      <div class="moz-signature">-- <br>
        <meta http-equiv="content-type" content="text/html;
          charset=UTF-8">
        <title></title>
        <font color="#1F497D"><font face="Century Gothic">Johnathan
            Mantey<br>
            <small>Senior Software Engineer</small><br>
            <big><font color="#555555"><small><b>azad te</b><b>chnology
                    partners</b></small><br>
                <small><font color="#1F497D"><small>Contributing to
                      Technology Innovation since 1992</small></font><small><br>
                    <font color="#1F497D">Phone: (503) 712-6764<br>
                      Email: <a
                        href="mailto:johnathanx.mantey@intel.com"
                        moz-do-not-send="true">johnathanx.mantey@intel.com</a></font></small><br>
                  <br>
                </small></font></big></font></font> </div>
    </blockquote>
  </body>
</html>

--------------C4E630BCD9B4078E7C068B99--

