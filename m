Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E24192A8F03
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 06:46:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS8X86bX0zDrFY
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 16:46:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RWYscYUd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS8W83RVczDrCG
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 16:45:38 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A65WkDt084612
 for <openbmc@lists.ozlabs.org>; Fri, 6 Nov 2020 00:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=ZOASP8VA55UNQpdfbDwb8vr77k/jcF9m4AfIU3fdVzo=;
 b=RWYscYUdslERwpkFlS4k3rAktu7m2aVq+MZ0fPbniEaIDvJLorfLR6CBlZG9HcuHyGhi
 YV3t/Rd1bz4pEsbKSIWg92Na825Z9P+Bwg/lKItd4NwPzYC8exs3XBT6nxCfRRTi8Wp9
 r1/lCBXK4TV2vHjPUi/kE01zc2dzINB8pYCYg2LcDCdCBvXbuztEz6HSGi9hP//fvu1V
 BLkLfC1i3ma2IG1kLwIqLY7np2lIwgmsb4vWM/Z+pF7G+GfyUcWG8CMXCatBmm1qVJxm
 L/0bhjecSHArSiShpGwSREp5WdWr/gONAh6kDgsQa+0pDN/iaPlWjDQUUS3XIkMgQSPD vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mhxk4318-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2020 00:45:35 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A65Wpre088180
 for <openbmc@lists.ozlabs.org>; Fri, 6 Nov 2020 00:45:35 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mhxk4305-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 00:45:35 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A65hFHt025019;
 Fri, 6 Nov 2020 05:45:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 34h0fcx5qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 05:45:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0A65jUxH58130696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 05:45:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 706A811C058;
 Fri,  6 Nov 2020 05:45:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E45A11C04C;
 Fri,  6 Nov 2020 05:45:28 +0000 (GMT)
Received: from [9.206.169.84] (unknown [9.206.169.84])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Nov 2020 05:45:27 +0000 (GMT)
Subject: Re: Firmware Version in ipmi mc info
To: Shakeeb B K <shakeebbk@gmail.com>
References: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
 <b75f4c12-0d40-c529-40cd-3fb9ec1fc0ce@linux.vnet.ibm.com>
 <CABYu0WhSqhhxULpe+f9eq2e8Tv4uYzh2DaDRxfXe838pk4EP4Q@mail.gmail.com>
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Message-ID: <352ce958-186c-a26c-382f-d21ed26729ef@linux.vnet.ibm.com>
Date: Fri, 6 Nov 2020 11:15:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CABYu0WhSqhhxULpe+f9eq2e8Tv4uYzh2DaDRxfXe838pk4EP4Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E0F01B8CA93ED9E96F4F25CC"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_01:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060038
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E0F01B8CA93ED9E96F4F25CC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Shakeeb,

Typically there is a D-Bus object for each version and that implements 
the xyz.openbmc_project.Software.Version interface. 
/xyz/openbmc_project/software doesn't implement the interface.

busctl tree xyz.openbmc_project.Software.BMC.Updater
└─/xyz
   └─/xyz/openbmc_project
     └─/xyz/openbmc_project/software
       ├─/xyz/openbmc_project/software/6b6a7c53
       └─/xyz/openbmc_project/software/76174d14

I guess the upstream implementation of this command is broken with the 
latest version format. We discussed this in the community, work is not 
done yet. https://lists.ozlabs.org/pipermail/openbmc/2020-August/022598.html

Regards,
Tom


On 06-11-2020 09:38, Shakeeb B K wrote:
> Hi Tom, Thanks for the reply. But it doesn't seem to work as expected. 
> I'm looking at...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi Tom,
>
> Thanks for the reply.
> But it doesn't seem to work as expected. I'm looking at the 
> witherspoon-bmc on QEMU.
>
> root@witherspoon:~# systemctl status 
> xyz.openbmc_project.Software.BMC.Updater
> * *xyz.openbmc_project.Software.BMC.Updater.service* - OpenBMC 
> Software Update Manager
>      Loaded: loaded 
> (/lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service; 
> enabled; vendor preset: enabled)
>     Drop-In: 
> /lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service.d
>              `-software-bmc-updater.conf
>      Active: *active (running)* since Thu 2020-11-05 14:10:57 UTC; 13h ago
>    Main PID: 387 (phosphor-image-)
>      CGroup: 
> /system.slice/xyz.openbmc_project.Software.BMC.Updater.service
>              `-387 /usr/bin/phosphor-image-updater
>
> Nov 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC Software 
> Update Manager...
> Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC Software 
> Update Manager.
>
> root@witherspoon:~# busctl get-property xyz.openbmc_project.State.BMC 
> /xyz/openbmc_project/state/bmc0 xyz.openbmc_project.State.BMC 
> CurrentBMCState
> s "*xyz.openbmc_project.State.BMC.BMCState.Ready*"
>
> *root@witherspoon:~# busctl get-property 
> xyz.openbmc_project.Software.Version /xyz/openbmc_project/software 
> xyz.openbmc_project.Software.Version Version
> Failed to get property Version on interface 
> xyz.openbmc_project.Software.Version: Unknown interface 
> xyz.openbmc_project.Software.Version or property Version.*
>
> root@witherspoon:~# busctl introspect --no-pager 
> xyz.openbmc_project.Software.Version /xyz/openbmc_project/software
> NAME                                TYPE      SIGNATURE  RESULT/VALUE 
>  FLAGS
> org.freedesktop.DBus.Introspectable interface -          -           -
> .Introspect                         method    -          s           -
> org.freedesktop.DBus.ObjectManager  interface -          -           -
> .GetManagedObjects                  method    -  a{oa{sa{sv}}} -
> .InterfacesAdded                    signal    oa{sa{sv}} -           -
> .InterfacesRemoved                  signal    oas        -           -
> org.freedesktop.DBus.Peer           interface -          -           -
> .GetMachineId                       method    -          s           -
> .Ping                               method    -          -           -
> org.freedesktop.DBus.Properties     interface -          -           -
> .Get                                method    ss         v           -
> .GetAll                             method    s  a{sv}         -
> .Set                                method    ssv        -           -
> .PropertiesChanged                  signal    sa{sv}as   -           -
>
>
> Thanks,
> Shakeeb
>
> On Fri, Nov 6, 2020 at 8:37 AM TOM JOSEPH <tomjose@linux.vnet.ibm.com 
> <mailto:tomjose@linux.vnet.ibm.com>> wrote:
>
>     Hey Shakeeb,
>
>     The service implementing the xyz.openbmc_project.Software.Version
>     should be running in the case of a normal boot as well. In our
>     systems the service is xyz.openbmc_project.Software.BMC.Updater
>     and the Version property is populated when the BMCState is Ready.
>
>     Regards,
>     Tom
>
>     On 05-11-2020 20:02, Shakeeb B K wrote:
>>     Hi All, Currently the ipmi handler for "mc info" command
>>     depends on the "Version"...
>>     This Message Is From an External Sender
>>     This message came from outside your organization.
>>
>>     Hi All,
>>
>>     Currently the ipmi handler for "mc info" command depends on the
>>     "Version" property on
>>     interface xyz.openbmc_project.Software.Version.
>>     But this is getting populated only on the image update path by
>>     phosphor-bmc-code-mgmt.
>>     Shouldn't the version be set on a normal boot as well? Is this a
>>     gap in current implementation?
>>
>>     Thanks,
>>     Shakeeb
>

--------------E0F01B8CA93ED9E96F4F25CC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Shakeeb,<br>
      <br>
      Typically there is a D-Bus object for each version and that
      implements the xyz.openbmc_project.Software.Version
      interface. /xyz/openbmc_project/software doesn't implement the
      interface.<br>
      <br>
      busctl tree xyz.openbmc_project.Software.BMC.Updater<br>
      └─/xyz<br>
        └─/xyz/openbmc_project<br>
          └─/xyz/openbmc_project/software<br>
            ├─/xyz/openbmc_project/software/6b6a7c53<br>
            └─/xyz/openbmc_project/software/76174d14</p>
    <p>I guess the upstream implementation of this command is broken
      with the latest version format. We discussed this in the
      community, work is not done yet.
      <a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/pipermail/openbmc/2020-August/022598.html">https://lists.ozlabs.org/pipermail/openbmc/2020-August/022598.html</a><br>
    </p>
    Regards,<br>
    Tom
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06-11-2020 09:38, Shakeeb B K wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABYu0WhSqhhxULpe+f9eq2e8Tv4uYzh2DaDRxfXe838pk4EP4Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <meta name="viewport" content="width=device-width;
        initial-scale=1.0; maximum-scale=1.0; user-scalable=no;">
      <style>
      /* Mobile */
      @media screen and (max-width: 630px){
        * {-webkit-text-size-adjust: none}
        a[href^="x-apple-data-detectors:"] { color: inherit; text-decoration: none; }
        .pfptTitle { font-size:22px !important; line-height:26px !important; text-align: center !important; }
        .pfptSubtitle { font-size:14px !important; line-height:18px !important; text-align: center !important; }
        
        .pfptMainWrapper { margin-top: 0 !important; margin-right: 0 !important; margin-left: 0 !important; }
        th[class="pfptTableColumnLeft"] {width:100% !important; height:auto !important; display:block !important; text-align: center !important; }
        th[class="pfptTableColumnRight"] {width:100% !important; height:auto !important; display:block !important; text-align: center !important; }

        .pfptButton { font-size:16px !important; line-height:16px !important; width: 50% !important; display:block !important; margin-right: auto!important; margin-left: auto!important; }   
        .pfptButton a { font-size: 16px; } 
        .pfptButton span { font-size: 16px; }     
      }
      /* Tablet, Laptop, Desktop */
      @media screen and (min-width: 631px){
        th[class="pfptTableColumnLeft"] { width: 50% !important; height:auto !important; }
        th[class="pfptTableColumnRight"] { width: 50% !important; height:auto !important; text-align: right !important; } 
      }
      .pfptPreheader { display:none !important; visibility:hidden; mso-hide:all; font-size:1px; line-height:1px; max-height:0px; max-width:0px; opacity:0; overflow:hidden; }
    </style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN --> <span class="pfptPreheader"
        style="display:none
!important;visibility:hidden;mso-hide:all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;">
        Hi Tom, Thanks for the reply. But it doesn't seem to work as
        expected. I'm looking at... 
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
              </span>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <table style="width:100%;border-radius:4px;margin-bottom:16px;"
        width="100%" cellspacing="0" cellpadding="16" border="0"
        bgcolor="#9CA3A7">
        <tbody>
          <tr>
            <td align="center">
              <table class="pfptMainWrapper" style="width:100%;"
                width="100%" cellspacing="0" cellpadding="0" border="0"
                align="center">
                <tbody>
                  <tr>
                    <td style="border-radius:4px;" valign="top"
                      align="center">
                      <table style="max-width:100%; width:100%;"
                        width="100%" cellspacing="0" cellpadding="0"
                        border="0" bgcolor="#9CA3A7" align="center">
                        <tbody>
                          <tr>
                            <!-- Message : BEGIN --> <th
                              class="pfptTableColumnLeft"
style="font-weight:normal;padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;width:100%;height:auto;"
                              valign="top">
                              <table
                                style="width:100%;height:auto;text-align:left;vertical-align:middle;"
                                width="100%" cellspacing="0"
                                cellpadding="0">
                                <tbody>
                                  <tr>
                                    <td> <span class="pfptTitle"
style="font-family:'Roboto','Helvetica','Arial',sans-serif;font-weight:bold;font-size:18px;line-height:20px;display:block;margin-bottom:4px;word-wrap:normal;">This
                                        Message Is From an External
                                        Sender</span> </td>
                                  </tr>
                                  <tr>
                                    <td> <span class="pfptSubtitle"
style="font-weight:normal;font-family:'Roboto','Helvetica','Arial',sans-serif;font-size:13px;line-height:16px;display:block;word-wrap:normal;">This
                                        message came from outside your
                                        organization.</span> </td>
                                  </tr>
                                </tbody>
                              </table>
                            </th>
                            <!-- Message : END --> </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <div dir="ltr">Hi Tom,
        <div><br>
        </div>
        <div>Thanks for the reply.</div>
        <div>But it doesn't seem to work as expected. I'm looking at the
          witherspoon-bmc on QEMU.</div>
        <div><br>
        </div>
        <div><font face="monospace">root@witherspoon:~# systemctl status
            xyz.openbmc_project.Software.BMC.Updater<br>
            * <b>xyz.openbmc_project.Software.BMC.Updater.service</b> -
            OpenBMC Software Update Manager<br>
                 Loaded: loaded
            (/lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service;
            enabled; vendor preset: enabled)<br>
                Drop-In:
            /lib/systemd/system/xyz.openbmc_project.Software.BMC.Updater.service.d<br>
                         `-software-bmc-updater.conf<br>
                 Active: <b>active (running)</b> since Thu 2020-11-05
            14:10:57 UTC; 13h ago<br>
               Main PID: 387 (phosphor-image-)<br>
                 CGroup:
            /system.slice/xyz.openbmc_project.Software.BMC.Updater.service<br>
                         `-387 /usr/bin/phosphor-image-updater<br>
            <br>
            Nov 05 14:10:53 witherspoon systemd[1]: Starting OpenBMC
            Software Update Manager...<br>
            Nov 05 14:10:57 witherspoon systemd[1]: Started OpenBMC
            Software Update Manager.</font></div>
        <div><font face="monospace"><br>
            root@witherspoon:~# busctl get-property
            xyz.openbmc_project.State.BMC
            /xyz/openbmc_project/state/bmc0
            xyz.openbmc_project.State.BMC CurrentBMCState<br>
            s "<b>xyz.openbmc_project.State.BMC.BMCState.Ready</b>"<br>
            <br>
          </font></div>
        <div><font face="monospace"><b>root@witherspoon:~# busctl
              get-property xyz.openbmc_project.Software.Version
              /xyz/openbmc_project/software
              xyz.openbmc_project.Software.Version Version<br>
              Failed to get property Version on interface
              xyz.openbmc_project.Software.Version: Unknown interface
              xyz.openbmc_project.Software.Version or property Version.</b><br>
            <br>
          </font></div>
        <div><font face="monospace">root@witherspoon:~# busctl
            introspect --no-pager xyz.openbmc_project.Software.Version
            /xyz/openbmc_project/software <br>
            NAME                                TYPE      SIGNATURE
             RESULT/VALUE  FLAGS<br>
            org.freedesktop.DBus.Introspectable interface -          -  
                      -<br>
            .Introspect                         method    -          s  
                      -<br>
            org.freedesktop.DBus.ObjectManager  interface -          -  
                      -<br>
            .GetManagedObjects                  method    -        
             a{oa{sa{sv}}} -<br>
            .InterfacesAdded                    signal    oa{sa{sv}} -  
                      -<br>
            .InterfacesRemoved                  signal    oas        -  
                      -<br>
            org.freedesktop.DBus.Peer           interface -          -  
                      -<br>
            .GetMachineId                       method    -          s  
                      -<br>
            .Ping                               method    -          -  
                      -<br>
            org.freedesktop.DBus.Properties     interface -          -  
                      -<br>
            .Get                                method    ss         v  
                      -<br>
            .GetAll                             method    s        
             a{sv}         -<br>
            .Set                                method    ssv        -  
                      -<br>
            .PropertiesChanged                  signal    sa{sv}as   -  
                      -</font><br>
        </div>
        <div><font face="monospace"><br>
          </font></div>
        <div>
          <div><br>
          </div>
          <div>Thanks,</div>
          <div>Shakeeb</div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Nov 6, 2020 at 8:37 AM
          TOM JOSEPH &lt;<a href="mailto:tomjose@linux.vnet.ibm.com"
            moz-do-not-send="true">tomjose@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <p>Hey Shakeeb,<br>
              <br>
              The service implementing the
              xyz.openbmc_project.Software.Version should be running in
              the case of a normal boot as well. In our systems the
              service is xyz.openbmc_project.Software.BMC.Updater and
              the Version property is populated when the BMCState is
              Ready.<br>
            </p>
            Regards,<br>
            Tom<br>
            <br>
            <div>On 05-11-2020 20:02, Shakeeb B K wrote:<br>
            </div>
            <blockquote type="cite"> <span
style="font-size:1px;color:rgb(255,255,255);line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;display:none">
                Hi All, Currently the ipmi handler for "mc info" command
                depends on the "Version"...                         
                                                                     
                                                                     
                                                                </span>
              <table
                style="width:100%;border-radius:4px;margin-bottom:16px"
                width="100%" cellspacing="0" cellpadding="16" border="0"
                bgcolor="#9CA3A7">
                <tbody>
                  <tr>
                    <td align="center">
                      <table style="width:100%" width="100%"
                        cellspacing="0" cellpadding="0" border="0"
                        align="center">
                        <tbody>
                          <tr>
                            <td style="border-radius:4px" valign="top"
                              align="center">
                              <table style="max-width:100%;width:100%"
                                width="100%" cellspacing="0"
                                cellpadding="0" border="0"
                                bgcolor="#9CA3A7" align="center">
                                <tbody>
                                  <tr>
                                    <th
                                      style="font-weight:normal;padding:0px;width:100%;height:auto"
                                      valign="top">
                                      <table
                                        style="width:100%;height:auto;text-align:left;vertical-align:middle"
                                        width="100%" cellspacing="0"
                                        cellpadding="0">
                                        <tbody>
                                          <tr>
                                            <td> <span
style="font-family:Roboto,Helvetica,Arial,sans-serif;font-weight:bold;font-size:18px;line-height:20px;display:block;margin-bottom:4px">This
                                                Message Is From an
                                                External Sender</span> </td>
                                          </tr>
                                          <tr>
                                            <td> <span
style="font-weight:normal;font-family:Roboto,Helvetica,Arial,sans-serif;font-size:13px;line-height:16px;display:block">This
                                                message came from
                                                outside your
                                                organization.</span> </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </th>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div dir="ltr">Hi All,
                <div><br>
                </div>
                <div>Currently the ipmi handler for "mc info" command
                  depends on the "Version" property on
                  interface xyz.openbmc_project.Software.Version. </div>
                <div>But this is getting populated only on the image
                  update path by phosphor-bmc-code-mgmt.</div>
                <div>Shouldn't the version be set on a normal boot as
                  well? Is this a gap in current implementation? </div>
                <div><br>
                </div>
                <div>Thanks,</div>
                <div>Shakeeb</div>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------E0F01B8CA93ED9E96F4F25CC--

