Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B641A91
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 05:10:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NsLk3kznzDqlm
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 13:10:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NsL93h3QzDql2
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 13:09:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5C37r2x024022
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 23:09:46 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t2ng4qrk7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 23:09:45 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 12 Jun 2019 04:09:44 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 04:09:42 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5C39fXb33423430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 03:09:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD29F11C04C
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 03:09:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B0B811C058
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 03:09:40 +0000 (GMT)
Received: from [9.85.128.70] (unknown [9.85.128.70])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 03:09:39 +0000 (GMT)
Subject: Re: Network Settings GUI
To: openbmc@lists.ozlabs.org
References: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 12 Jun 2019 08:39:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------CED0FC3839542B4C04553EB4"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061203-0028-0000-0000-0000037981DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061203-0029-0000-0000-000024397321
Message-Id: <0dde6e4b-484c-6d44-7e36-92551dbdd460@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120019
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
--------------CED0FC3839542B4C04553EB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jandra,

Please find my comments inline ingreen.

Regards

Ratan Gupta

On 10/06/19 8:53 PM, Jandra A wrote:
> Hello all,
>
> Here is the proposal for the Network Settings GUI: 
> https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical
> To navigate, click on any flashing blue rectangles or use the right 
> and left keyboard arrows.
>
> The design is based on the needs found by our research with 
> stakeholders and users.
>
> With the GUI, a user is able to assign a Fully Qualified Domain Name 
> (FQDN), and choose either DHCP or static configuration, for any 
> selected interface.
>
> If DHCP is chosen, the GUI will reflect the appropriate default 
> gateway, DNS server, and IP address assigned by the DHCP server. If 
> static is selected, users manually assign the default gateway, as well 
> as multiple DNS servers and a single IP address (not including the one 
> assigned by zeroconf).
>
> Despite the type of configuration selected (DHCP or static), 
> zero-configuration is always on to protect the user and ensure there 
> is always an IP address assigned. However, once an interface has a non 
> zeroconf IP address assigned, users have the flexibility to 
> permanently delete that address. Currently, users can only temporarily 
> delete these using CLI; once they reboot, the addresses come back. 
> Permanently removing IP addresses assigned by zero-configuration is 
> important to customers who need to account for every single IP address.

Are you proposing that filter to be done at gui side? Suppose at first 
boot, By default DHCP and  Zero config is enabled, In that case back end 
will get two IP address

(DHCP/ZeroConfig) and suppose after that user has not disabled the 
Zeroconfig than GUI will keep getting the two ipaddresses, in that case 
does the GUI apply the filter

to show single IP address.

Are we planning to propose new settings for GUI for IPv6

In IpV6 we may have multiple IPaddresses on the same interface 
(LinkLocal,autoconf,static)

>
>
> NOTE: The reason for limiting to a single IP address per interface is 
> that our research from users and stakeholders indicates that multiple 
> would never be used and in fact it could make it easy to make a 
> mistake, so for this reason we will not support it in the GUI. 
> Additionally, there will be no support for VLAN as it was not expected 
> by users and added unnecessary confusion.

What about the existing client network deployment where management 
traffic has been separated from the host traffic through VLAN?

We got this request from one of our IBM Internal team(HPC).

>
> Regards,
> Jandra Aranguren
>
>

--------------CED0FC3839542B4C04553EB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jandra,</p>
    <p>Please find my comments inline in<font color="#33cc00"> green</font>.</p>
    <p>Regards</p>
    <p>Ratan Gupta<br>
    </p>
    <div class="moz-cite-prefix">On 10/06/19 8:53 PM, Jandra A wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hello all,<br>
        <div><br>
        </div>
        <div>Here is the proposal for the Network Settings GUI: <a
            href="https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical"
            moz-do-not-send="true">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical</a> <br>
          To navigate, click on any flashing blue rectangles or use the
          right and left keyboard arrows.</div>
        <div><br>
        </div>
        <div>The design is based on the needs found by our research with
          stakeholders and users. </div>
        <div><br>
        </div>
        <div>With the GUI, a user is able to assign a Fully Qualified
          Domain Name (FQDN), and choose either DHCP or static
          configuration, for any selected interface.</div>
        <div><br>
        </div>
        <div>If DHCP is chosen, the GUI will reflect the appropriate
          default gateway, DNS server, and IP address assigned by the
          DHCP server. If static is selected, users manually assign the
          default gateway, as well as multiple DNS servers and a single
          IP address (not including the one assigned by zeroconf). </div>
        <div><br>
        </div>
        <div>Despite the type of configuration selected (DHCP or
          static), zero-configuration is always on to protect the user
          and ensure there is always an IP address assigned. However,
          once an interface has a non zeroconf IP address assigned,
          users have the flexibility to permanently delete that address.
          Currently, users can only temporarily delete these using CLI;
          once they reboot, the addresses come back. Permanently
          removing IP addresses assigned by zero-configuration is
          important to customers who need to account for every single IP
          address. <br>
        </div>
      </div>
    </blockquote>
    <p>Are you proposing that filter to be done at gui side? Suppose at
      first boot, By default DHCP and  Zero config is enabled, In that
      case back end will get two IP address <br>
    </p>
    <p>(DHCP/ZeroConfig) and suppose after that user has not disabled
      the Zeroconfig than GUI will keep getting the two ipaddresses, in
      that case does the GUI apply the filter <br>
    </p>
    <p>to show single IP address.<br>
    </p>
    <p>Are we planning to propose new settings for GUI for IPv6</p>
    <p>In IpV6 we may have multiple IPaddresses on the same interface
      (LinkLocal,autoconf,static)<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div><br>
        </div>
        <div>NOTE: The reason for limiting to a single IP address per
          interface is that our research from users and stakeholders
          indicates that multiple would never be used and in fact it
          could make it easy to make a mistake, so for this reason we
          will not support it in the GUI. Additionally, there will be no
          support for VLAN as it was not expected by users and added
          unnecessary confusion. <br>
        </div>
      </div>
    </blockquote>
    <p>What about the existing client network deployment where
      management traffic has been separated from the host traffic
      through VLAN?</p>
    <p>We got this request from one of our IBM Internal team(HPC).<br>
    </p>
    <blockquote type="cite"
cite="mid:CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Jandra Aranguren</div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------CED0FC3839542B4C04553EB4--

