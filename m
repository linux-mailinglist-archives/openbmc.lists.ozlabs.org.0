Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1D2A8D5C
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 04:08:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS51x1SGLzDrCj
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 14:08:37 +1100 (AEDT)
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
 header.s=pp1 header.b=mX+zv9qF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS50R3mmdzDr9B
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 14:07:12 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A632OA6008296
 for <openbmc@lists.ozlabs.org>; Thu, 5 Nov 2020 22:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=bYWzb6i/Vd7+Efd5BaSepcSK/xLmhlZFOEZ4jLZBox0=;
 b=mX+zv9qFqMcMW9tjIlulZtJ8j3PIJN0t8pvfBGowsZCrO99BGYWgcWQj9dDsvL6W7ByZ
 6FLQ+8Ir+pJjPt/1wnpCpsN7PPAZsZUtourWbcYdA8ukh957TixVFjpg3/xgiB3CRDi4
 TkZnVfJoOPDPhZ1nQjMib+cOtU5UmNXVVnYS+ZdGuMTP337rDTWXBqFryrroAzenJYqp
 Ifp+LJCaFa4xEByl5Xj3zw4t95cQn+2DReIaGp6aUN/QF6esWXMT5p8o5pEDpQcAnyQY
 Ju1LMaRERN1FTMjSuxhis/Y+32+8kqlAsKXd/2YiZTEoRdooKP3Z6tVZ7uB87fuNlm9Z yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mnubwye1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 22:07:09 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A632SuA008580
 for <openbmc@lists.ozlabs.org>; Thu, 5 Nov 2020 22:07:09 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mnubwydg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 22:07:08 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6376bV023451;
 Fri, 6 Nov 2020 03:07:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 34h01udtst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 03:07:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0A63740p59244900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 03:07:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 590F311C04C;
 Fri,  6 Nov 2020 03:07:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B432D11C052;
 Fri,  6 Nov 2020 03:07:03 +0000 (GMT)
Received: from [9.79.224.42] (unknown [9.79.224.42])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Nov 2020 03:07:03 +0000 (GMT)
Subject: Re: Firmware Version in ipmi mc info
To: Shakeeb B K <shakeebbk@gmail.com>, openbmc@lists.ozlabs.org
References: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Message-ID: <b75f4c12-0d40-c529-40cd-3fb9ec1fc0ce@linux.vnet.ibm.com>
Date: Fri, 6 Nov 2020 08:37:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0A57FC0E8C204FE701E8A858"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_16:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=6
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060016
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
--------------0A57FC0E8C204FE701E8A858
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Shakeeb,

The service implementing the xyz.openbmc_project.Software.Version should 
be running in the case of a normal boot as well. In our systems the 
service is xyz.openbmc_project.Software.BMC.Updater and the Version 
property is populated when the BMCState is Ready.

Regards,
Tom

On 05-11-2020 20:02, Shakeeb B K wrote:
> Hi All, Currently the ipmi handler for "mc info" command depends on 
> the "Version"...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi All,
>
> Currently the ipmi handler for "mc info" command depends on the 
> "Version" property on interface xyz.openbmc_project.Software.Version.
> But this is getting populated only on the image update path by 
> phosphor-bmc-code-mgmt.
> Shouldn't the version be set on a normal boot as well? Is this a gap 
> in current implementation?
>
> Thanks,
> Shakeeb

--------------0A57FC0E8C204FE701E8A858
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey Shakeeb,<br>
      <br>
      The service implementing the xyz.openbmc_project.Software.Version
      should be running in the case of a normal boot as well. In our
      systems the service is xyz.openbmc_project.Software.BMC.Updater
      and the Version property is populated when the BMCState is Ready.<br>
    </p>
    Regards,<br>
    Tom<br>
    <br>
    <div class="moz-cite-prefix">On 05-11-2020 20:02, Shakeeb B K wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABYu0Wjn-YB4HO37nkxoJyq8EW6=bV4P5EZiHij0y3SxEYVEkw@mail.gmail.com">
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
        Hi All, Currently the ipmi handler for "mc info" command
        depends on the "Version"... 
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
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
      <div dir="ltr">Hi All,
        <div><br>
        </div>
        <div>Currently the ipmi handler for "mc info" command depends on
          the "Version" property on
          interface xyz.openbmc_project.Software.Version. </div>
        <div>But this is getting populated only on the image update path
          by phosphor-bmc-code-mgmt.</div>
        <div>Shouldn't the version be set on a normal boot as well? Is
          this a gap in current implementation? </div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Shakeeb</div>
      </div>
    </blockquote>
  </body>
</html>

--------------0A57FC0E8C204FE701E8A858--

