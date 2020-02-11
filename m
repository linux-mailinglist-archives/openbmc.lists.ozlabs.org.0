Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123F159A39
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 21:08:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HDNd33bTzDqNC
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 07:08:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HDMz1TWmzDqKH
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 07:07:42 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BK7V5i032464
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 15:07:39 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1uckmr2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 15:07:38 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01BK7a00032629
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 15:07:37 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1uckmqu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 15:07:36 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01BK4vs1008054;
 Tue, 11 Feb 2020 20:07:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2y1mm7w2j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 20:07:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01BK7FfR41615860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 20:07:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 909B678060;
 Tue, 11 Feb 2020 20:07:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BABD7805E;
 Tue, 11 Feb 2020 20:07:15 +0000 (GMT)
Received: from [9.10.100.197] (unknown [9.10.100.197])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 11 Feb 2020 20:07:15 +0000 (GMT)
Subject: Re: Redfish security question (user enumeration)
To: Richard Hanley <rhanley@google.com>, Joseph Reynolds <jrey@linux.ibm.com>
References: <fe46c534-7e23-bc54-2ae9-0057866d6be0@linux.ibm.com>
 <CAH1kD+aMerQJmUox1sDtuRFNAFUchyum3w1sbbfyKYfOon_P2A@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <1058df76-1dd8-d557-af27-0c929ee805e6@linux.vnet.ibm.com>
Date: Tue, 11 Feb 2020 14:07:14 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAH1kD+aMerQJmUox1sDtuRFNAFUchyum3w1sbbfyKYfOon_P2A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------EC9D3D47663754EC64EFC1A3"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_05:2020-02-11,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=866 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110133
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------EC9D3D47663754EC64EFC1A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/10/2020 12:21 PM, Richard Hanley wrote:
>
> One possible compromise is to make the account collection 
> discoverable, but only put the users account into the response (unless 
> it is an admin user).
>
>
> On Mon, Feb 10, 2020 at 9:36 AM Joseph Reynolds <jrey@linux.ibm.com 
> <mailto:jrey@linux.ibm.com>> wrote:
>
>     The Redfish spec recently changed to allow users with the Login
>     privilege to enumerate all BMC users.  Previously only the admin user
>     could do this.  I disagree with this change and believe it is an
>     unnecessary information exposure.  Details are in the Redfish
>     forum post.
>
>     https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration
>
>
>     OpenBMC has the corresponding implementation change pending here:
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881
>
>
This was discussed in the Redfish call today. Redfish will update the 
documentation and registry to make clear only the current account will 
be shown in the AccountCollection if the user lacks the ConfigureUsers 
privilege (Richard's suggestion). A response in the thread explains the 
same.

Thanks,
Gunnar



--------------EC9D3D47663754EC64EFC1A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/10/2020 12:21 PM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH1kD+aMerQJmUox1sDtuRFNAFUchyum3w1sbbfyKYfOon_P2A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      <div dir="ltr">
        <div>One possible compromise is to make the account collection
          discoverable, but only put the users account into the response
          (unless it is an admin user).</div>
        <div><br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, Feb 10, 2020 at 9:36
          AM Joseph Reynolds &lt;<a href="mailto:jrey@linux.ibm.com"
            moz-do-not-send="true">jrey@linux.ibm.com</a>&gt; wrote:<br>
          <br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The
          Redfish spec recently changed to allow users with the Login <br>
          privilege to enumerate all BMC users.  Previously only the
          admin user <br>
          could do this.  I disagree with this change and believe it is
          an <br>
          unnecessary information exposure.  Details are in the Redfish
          forum post.<br>
          <br>
          <a
href="https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://redfishforum.com/thread/281/manageraccountcollection-change-allows-account-enumeration</a><br>
          <br>
          <br>
          OpenBMC has the corresponding implementation change pending
          here:<br>
          <a
            href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28881</a><br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p>This was discussed in the Redfish call today. Redfish will update
      the documentation and registry to make clear only the current
      account will be shown in the AccountCollection if the user lacks
      the ConfigureUsers privilege (Richard's suggestion). A response in
      the thread explains the same.<br>
      <br>
      Thanks, <br>
      Gunnar<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------EC9D3D47663754EC64EFC1A3--

