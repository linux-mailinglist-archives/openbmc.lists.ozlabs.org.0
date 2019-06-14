Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65C45AF3
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 12:52:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QHWV1PVczDrdp
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 20:52:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QHVr3HlCzDrZZ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 20:52:18 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EAgjno045405
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 06:52:15 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t48maky1k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 06:52:14 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Fri, 14 Jun 2019 11:52:12 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 11:52:10 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5EAq9kY62587032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 10:52:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF5A152054
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 10:52:08 +0000 (GMT)
Received: from [9.85.142.3] (unknown [9.85.142.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id E208C5204E
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 10:52:06 +0000 (GMT)
Subject: Re: Network Settings GUI
To: openbmc@lists.ozlabs.org
References: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
 <0dde6e4b-484c-6d44-7e36-92551dbdd460@linux.vnet.ibm.com>
 <CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Fri, 14 Jun 2019 16:22:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------3A7E73B11422BE45F01B6E3C"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061410-0028-0000-0000-0000037A441B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061410-0029-0000-0000-0000243A4087
Message-Id: <bfbe24e5-25dc-a7fd-ab14-2dae8801a5d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140090
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
--------------3A7E73B11422BE45F01B6E3C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jandra,

On 13/06/19 1:01 AM, Jandra A wrote:
> Hello Ratan,
>
>     Are you proposing that filter to be done at gui side? Suppose at
>     first boot, By default DHCP and  Zero config is enabled, In that
>     case back end will get two IP address (DHCP/ZeroConfig) and
>     suppose after that user has not disabled the Zeroconfig than GUI
>     will keep getting the two ipaddresses, in that case does the GUI
>     apply the filter to show single IP address.
>
> No filter on GUI side - In the case you are describing where by 
> default DHCP and zeroconfig are enabled and the user has not disabled 
> the zero config, the GUI will still show both. At any time, an 
> interface will have MAXIMUM two IP addresses, but one of those two 
> must be from zero config. The GUI should always reflect what is in the 
> backend, it will not be a good experience if we hide information from 
> users.
>
Then it should be good,Until some body comes and ask from us.
>
>
>     Are we planning to propose new settings for GUI for IPv6.
>     In IpV6 we may have multiple IPaddresses on the same interface
>     (LinkLocal,autoconf,static)
>
> As of now, all customers we have spoken with have said they do not 
> currently use IPV6 and have no plans to do so in the future, so this 
> was put on hold. If/when we choose to support IPV6, the design will be 
> updated to reflect it. Likely, it will be a very similar design with 
> the addition of an IPV6 section containing its own DNS servers and IP 
> addresses.
>
>
Is the GUI specific for IBM, if not then I know google is planning to 
support the IPv6 and the gui should be at par with other available 
stack(AMI/ATEN).
>
>     What about the existing client network deployment where management
>     traffic has been separated from the host traffic through VLAN?
>     We got this request from one of our IBM Internal team(HPC)
>
> I would love to know more about this as it is the first time I hear 
> where the requirement came from. Once we understand the use case for 
> it and the user needs, we can discuss prioritizing it for the GUI.
>
>
Please ping Victor Hu from IBM(HPC), I have seen the AMI as well as the 
SuperMicro(ATEN) stack, they are supporting it.

> Regards,
>
> Jandra A
>
>
>
>
> On Tue, Jun 11, 2019 at 10:10 PM Ratan Gupta 
> <ratagupt@linux.vnet.ibm.com <mailto:ratagupt@linux.vnet.ibm.com>> wrote:
>
>     Hi Jandra,
>
>     Please find my comments inline ingreen.
>
>     Regards
>
>     Ratan Gupta
>
>     On 10/06/19 8:53 PM, Jandra A wrote:
>>     Hello all,
>>
>>     Here is the proposal for the Network Settings GUI:
>>     https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical
>>     To navigate, click on any flashing blue rectangles or use the
>>     right and left keyboard arrows.
>>
>>     The design is based on the needs found by our research with
>>     stakeholders and users.
>>
>>     With the GUI, a user is able to assign a Fully Qualified Domain
>>     Name (FQDN), and choose either DHCP or static configuration, for
>>     any selected interface.
>>
>>     If DHCP is chosen, the GUI will reflect the appropriate default
>>     gateway, DNS server, and IP address assigned by the DHCP server.
>>     If static is selected, users manually assign the default gateway,
>>     as well as multiple DNS servers and a single IP address (not
>>     including the one assigned by zeroconf).
>>
>>     Despite the type of configuration selected (DHCP or static),
>>     zero-configuration is always on to protect the user and ensure
>>     there is always an IP address assigned. However, once an
>>     interface has a non zeroconf IP address assigned, users have the
>>     flexibility to permanently delete that address. Currently, users
>>     can only temporarily delete these using CLI; once they reboot,
>>     the addresses come back. Permanently removing IP addresses
>>     assigned by zero-configuration is important to customers who need
>>     to account for every single IP address.
>
>     Are you proposing that filter to be done at gui side? Suppose at
>     first boot, By default DHCP and  Zero config is enabled, In that
>     case back end will get two IP address
>
>     (DHCP/ZeroConfig) and suppose after that user has not disabled the
>     Zeroconfig than GUI will keep getting the two ipaddresses, in that
>     case does the GUI apply the filter
>
>     to show single IP address.
>
>     Are we planning to propose new settings for GUI for IPv6
>
>     In IpV6 we may have multiple IPaddresses on the same interface
>     (LinkLocal,autoconf,static)
>
>>
>>
>>     NOTE: The reason for limiting to a single IP address per
>>     interface is that our research from users and stakeholders
>>     indicates that multiple would never be used and in fact it could
>>     make it easy to make a mistake, so for this reason we will not
>>     support it in the GUI. Additionally, there will be no support for
>>     VLAN as it was not expected by users and added unnecessary
>>     confusion.
>
>     What about the existing client network deployment where management
>     traffic has been separated from the host traffic through VLAN?
>
>     We got this request from one of our IBM Internal team(HPC).
>
>>
>>     Regards,
>>     Jandra Aranguren
>>
>>

--------------3A7E73B11422BE45F01B6E3C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Jandra,</p>
    <div class="moz-cite-prefix">On 13/06/19 1:01 AM, Jandra A wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hello Ratan, </div>
        <div dir="ltr"><br>
        </div>
        <div dir="ltr">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Are you proposing that
            filter to be done at gui side? Suppose at first boot, By
            default DHCP and  Zero config is enabled, In that case back
            end will get two IP address (DHCP/ZeroConfig) and suppose
            after that user has not disabled the Zeroconfig than GUI
            will keep getting the two ipaddresses, in that case does the
            GUI apply the filter to show single IP address.</blockquote>
        </div>
        <div dir="ltr">
          <p>No filter on GUI side - In the case you are describing
            where by default DHCP and zeroconfig are enabled and the
            user has not disabled the zero config, the GUI will still
            show both. At any time, an interface will have MAXIMUM two
            IP addresses, but one of those two must be from zero config.
            The GUI should always reflect what is in the backend, it
            will not be a good experience if we hide information from
            users.</p>
        </div>
      </div>
    </blockquote>
    Then it should be good,Until some body comes and ask from us.<br>
    <blockquote type="cite"
cite="mid:CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <p><br>
          </p>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Are we planning to
            propose new settings for GUI for IPv6.<br>
            In IpV6 we may have multiple IPaddresses on the same
            interface (LinkLocal,autoconf,static)</blockquote>
          <p>As of now, all customers we have spoken with have said they
            do not currently use IPV6 and have no plans to do so in the
            future, so this was put on hold. If/when we choose to
            support IPV6, the design will be updated to reflect it.
            Likely, it will be a very similar design with the addition
            of an IPV6 section containing its own DNS servers and IP
            addresses. </p>
          <p><br>
          </p>
        </div>
      </div>
    </blockquote>
    Is the GUI specific for IBM, if not then I know google is planning
    to support the IPv6 and the gui should be at par with other
    available stack(AMI/ATEN).<br>
    <blockquote type="cite"
cite="mid:CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">What about the existing
            client network deployment where management traffic has been
            separated from the host traffic through VLAN?<br>
            We got this request from one of our IBM Internal team(HPC)</blockquote>
          <p>I would love to know more about this as it is the first
            time I hear where the requirement came from. Once we
            understand the use case for it and the user needs, we can
            discuss prioritizing it for the GUI. </p>
          <p><br>
          </p>
        </div>
      </div>
    </blockquote>
    <p>Please ping Victor Hu from IBM(HPC), I have seen the AMI as well
      as the SuperMicro(ATEN) stack, they are supporting it.</p>
    <blockquote type="cite"
cite="mid:CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <p>Regards,</p>
          <p>Jandra A</p>
        </div>
        <div dir="ltr"><br>
        </div>
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jun 11, 2019 at
            10:10 PM Ratan Gupta &lt;<a
              href="mailto:ratagupt@linux.vnet.ibm.com"
              moz-do-not-send="true">ratagupt@linux.vnet.ibm.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p>Hi Jandra,</p>
              <p>Please find my comments inline in<font color="#33cc00">
                  green</font>.</p>
              <p>Regards</p>
              <p>Ratan Gupta<br>
              </p>
              <div class="gmail-m_4581134513326033599moz-cite-prefix">On
                10/06/19 8:53 PM, Jandra A wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">Hello all,<br>
                  <div><br>
                  </div>
                  <div>Here is the proposal for the Network Settings
                    GUI: <a
                      href="https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical"
                      target="_blank" moz-do-not-send="true">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical</a> <br>
                    To navigate, click on any flashing blue rectangles
                    or use the right and left keyboard arrows.</div>
                  <div><br>
                  </div>
                  <div>The design is based on the needs found by our
                    research with stakeholders and users. </div>
                  <div><br>
                  </div>
                  <div>With the GUI, a user is able to assign a Fully
                    Qualified Domain Name (FQDN), and choose either DHCP
                    or static configuration, for any selected interface.</div>
                  <div><br>
                  </div>
                  <div>If DHCP is chosen, the GUI will reflect the
                    appropriate default gateway, DNS server, and IP
                    address assigned by the DHCP server. If static is
                    selected, users manually assign the default gateway,
                    as well as multiple DNS servers and a single IP
                    address (not including the one assigned by
                    zeroconf). </div>
                  <div><br>
                  </div>
                  <div>Despite the type of configuration selected (DHCP
                    or static), zero-configuration is always on to
                    protect the user and ensure there is always an IP
                    address assigned. However, once an interface has a
                    non zeroconf IP address assigned, users have the
                    flexibility to permanently delete that address.
                    Currently, users can only temporarily delete these
                    using CLI; once they reboot, the addresses come
                    back. Permanently removing IP addresses assigned by
                    zero-configuration is important to customers who
                    need to account for every single IP address. <br>
                  </div>
                </div>
              </blockquote>
              <p>Are you proposing that filter to be done at gui side?
                Suppose at first boot, By default DHCP and  Zero config
                is enabled, In that case back end will get two IP
                address <br>
              </p>
              <p>(DHCP/ZeroConfig) and suppose after that user has not
                disabled the Zeroconfig than GUI will keep getting the
                two ipaddresses, in that case does the GUI apply the
                filter <br>
              </p>
              <p>to show single IP address.<br>
              </p>
              <p>Are we planning to propose new settings for GUI for
                IPv6</p>
              <p>In IpV6 we may have multiple IPaddresses on the same
                interface (LinkLocal,autoconf,static)<br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div><br>
                  </div>
                  <div><br>
                  </div>
                  <div>NOTE: The reason for limiting to a single IP
                    address per interface is that our research from
                    users and stakeholders indicates that multiple would
                    never be used and in fact it could make it easy to
                    make a mistake, so for this reason we will not
                    support it in the GUI. Additionally, there will be
                    no support for VLAN as it was not expected by users
                    and added unnecessary confusion. <br>
                  </div>
                </div>
              </blockquote>
              <p>What about the existing client network deployment where
                management traffic has been separated from the host
                traffic through VLAN?</p>
              <p>We got this request from one of our IBM Internal
                team(HPC).<br>
              </p>
              <blockquote type="cite">
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
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------3A7E73B11422BE45F01B6E3C--

