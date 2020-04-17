Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB01AE273
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 18:45:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493hmK6RHBzDrhY
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 02:45:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493hlP01lkzDrfr
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 02:44:48 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HGXTTB014865; Fri, 17 Apr 2020 12:44:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30fevv2h2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 12:44:45 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03HGYcXL019187;
 Fri, 17 Apr 2020 12:44:44 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30fevv2h2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 12:44:44 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03HGfQ9d007179;
 Fri, 17 Apr 2020 16:44:44 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 30b5h73ppp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 16:44:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03HGih9R62259694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Apr 2020 16:44:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DBBEC6057;
 Fri, 17 Apr 2020 16:44:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 061F1C6055;
 Fri, 17 Apr 2020 16:44:40 +0000 (GMT)
Received: from [9.206.208.126] (unknown [9.206.208.126])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Apr 2020 16:44:40 +0000 (GMT)
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
To: Richard Hanley <rhanley@google.com>, Patrick Williams <patrick@stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
 <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
 <d3801437-bde4-ffe9-9f3e-1604ad174625@linux.ibm.com>
 <e292cc98-cdd8-2eff-3fd0-ba42762b2720@linux.vnet.ibm.com>
 <20200416204010.GD443018@heinlein.lan.stwcx.xyz>
 <CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <13f119b4-56fa-c6dd-2e1b-9718e4e41fc3@linux.vnet.ibm.com>
Date: Fri, 17 Apr 2020 11:44:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------7D5E866263A8B5F23CD5DE79"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_07:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004170128
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------7D5E866263A8B5F23CD5DE79
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/2020 7:42 PM, Richard Hanley wrote:
>
>     > The members on the call really wanted to encourage OpenBMC to
>     implement
>     > SSDP instead.
>
>     It probably isn't a bad thing to be able to support SSDP, don't get me
>     wrong, but "instead"?  Why would we want to take away service
>     advertisement functionality, unless someone wants to explicitly
>     disable it?
>
>     I can understand if they don't want to document, in the standard,
>     a way to
>     advertise the Redfish service over mDNS, but isn't that a different
>     problem from what we're asking for?  Aren't we asking for a method to
>     manage the enablement of services on the BMC, specifically our mDNS
>     service?  So, if we still have mDNS, don't we need a way to
>     configure it
>     through Redfish?
>
> I see your point here.  I guess there might be some implicit 
> assumption that adding it to a schema implies endorsement elsewhere.

Yeah, from Jeff's reply on the thread, "The concern is if we add this to 
ManagerNetworkProtocol, it would seem to indicate that Redfish supports 
mDNS/DNS-SD for discovery of Redfish services, which it does not (SSDP 
is the standard discovery mechanism). "

> Discovery is probably an area where supporting a diversity of 
> protocols is better than making a single choice.

A bit over my head here, but I believe Redfish's interoperability 
concern about supporting a second discovery protocol comes from then all 
Redfish implementations need to implement both otherwise different 
Redfish implementations aren't discoverable. This can be expanded to 
OpenBMC's use of mDNS vs Redfish's SSDP and hence the ask for OpenBMC to 
implement SSDP. A concern of compatibility of OpenBMC-based Redfish 
implementations vs other Redfish implementations.

These are all good questions. Anyone can sign up for an account and post 
to the Redfish forum if you are interested in pursuing.
https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol

Forum posts, along with new issues and proposals, are discussed on the 
main Redfish calls, Tuesday at 1:00 PM CT and Thursday at 2:00 PM CT if 
your company is a supporting member of Redfish.

Thanks,
Gunnar


--------------7D5E866263A8B5F23CD5DE79
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 4/16/2020 7:42 PM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; The members on the call really wanted to encourage
            OpenBMC to implement <br>
            &gt; SSDP instead.<br>
            <br>
            It probably isn't a bad thing to be able to support SSDP,
            don't get me<br>
            wrong, but "instead"?  Why would we want to take away
            service <br>
            advertisement functionality, unless someone wants to
            explicitly disable it?<br>
            <br>
            I can understand if they don't want to document, in the
            standard, a way to<br>
            advertise the Redfish service over mDNS, but isn't that a
            different<br>
            problem from what we're asking for?  Aren't we asking for a
            method to<br>
            manage the enablement of services on the BMC, specifically
            our mDNS<br>
            service?  So, if we still have mDNS, don't we need a way to
            configure it<br>
            through Redfish?<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <blockquote type="cite"
cite="mid:CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>I see your point here.  I guess there might be some
            implicit assumption that adding it to a schema implies
            endorsement elsewhere. <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Yeah, from Jeff's reply on the thread, "The concern is if we add
      this to ManagerNetworkProtocol, it would seem to indicate that
      Redfish supports mDNS/DNS-SD for discovery of Redfish services,
      which it does not (SSDP is the standard discovery mechanism). "<br>
    </p>
    <blockquote type="cite"
cite="mid:CAH1kD+bVgh0kjUt7bkt+7G5-0G66hneto-Ks2o6iNDXKxLsN8w@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>Discovery is probably an area where supporting a
            diversity of protocols is better than making a single
            choice.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>A bit over my head here, but I believe Redfish's interoperability
      concern about supporting a second discovery protocol comes from
      then all Redfish implementations need to implement both otherwise
      different Redfish implementations aren't discoverable. This can be
      expanded to OpenBMC's use of mDNS vs Redfish's SSDP and hence the
      ask for OpenBMC to implement SSDP. A concern of compatibility of
      OpenBMC-based Redfish implementations vs other Redfish
      implementations. <br>
      <br>
      These are all good questions. Anyone can sign up for an account
      and post to the Redfish forum if you are interested in pursuing. <br>
<a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol">https://redfishforum.com/thread/267/add-avahi-managernetworkprotocol</a><br>
      <br>
      Forum posts, along with new issues and proposals, are discussed on
      the main Redfish calls, Tuesday at 1:00 PM CT and Thursday at 2:00
      PM CT if your company is a supporting member of Redfish.<br>
      <br>
      Thanks, <br>
      Gunnar<br>
    </p>
  </body>
</html>

--------------7D5E866263A8B5F23CD5DE79--

