Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52941134F1D
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 22:49:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tNFM2QhSzDqWm
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 08:49:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tNDY3xTFzDqMM
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 08:49:00 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008LlVT6026218
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 16:48:57 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdg1byhkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 16:48:57 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 008Lj6vl029736
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 21:48:56 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2xajb7t531-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 21:48:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 008LmtRQ49349034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 21:48:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F10D7C6059
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 21:48:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A1B2C605B
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 21:48:53 +0000 (GMT)
Received: from [9.102.58.210] (unknown [9.102.58.210])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 21:48:53 +0000 (GMT)
Subject: Re: Moving the WebUI to Vue; Repo vs Branch
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <60d44fed-74e2-70e3-e91f-ae1289d1700f@linux.vnet.ibm.com>
Message-ID: <f560dbcf-1003-1dac-92ca-358d090a90ac@linux.vnet.ibm.com>
Date: Wed, 8 Jan 2020 15:48:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <60d44fed-74e2-70e3-e91f-ae1289d1700f@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------7FCEBD5C8D649EE336934255"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_06:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080171
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
--------------7FCEBD5C8D649EE336934255
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just following back up on this after the holidays. :)

On 12/18/2019 10:00 AM, Gunnar Mills wrote:
>
> Hi All,
>
> This is a follow on to previous discussions of moving the GUI away 
> from AngularJS and to a new framework, Vue, that was discussed on the 
> list and in the GUI design workgroup meeting.
>
> See:
> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018299.html
> https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group
>
> The team here had some questions about Vue and wanted to answer some 
> of our and the community concerns about moving to Vue, so over the 
> last few weeks, our team has spent time working on a Vue prototype. If 
> you are interested, https://github.com/gtmills/phosphor-webui-vue
>
> This prototype has a few working panels and builds with the current 
> webui recipe, 
> https://github.com/gtmills/openbmc/commit/de6e2daef54fa5ace473a42b9ff9014cc9cb02ba
>
> IBM is committed to moving the WebUI to Vue.
> Is anyone opposed to moving to Vue?
>
> Should this work be done in a separate repo?
>
> Or a separate branch in phosphor-webui, that would be merged into the 
> master branch once this Vue rewrite becomes functionally equivalent to 
> the current AngularJS application?
>
> Would anyone stay on the current AngularJS application?
>
> We plan to maintain the current AngularJS application until the Vue 
> rewrite becomes functionally equivalent, would anyone maintain the 
> AngularJS application after such a time?
>
>

I think a new repository is the safest bet here.
Anyone opposed to a new repo for the webui vue rewrite?

Possible names:
webui
webui-v2
phosphor-webui-v2
phosphor-webui-vue
webui-vue


--------------7FCEBD5C8D649EE336934255
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><tt>Just following back up on this after the holidays. :) </tt></p>
    <div class="moz-cite-prefix">On 12/18/2019 10:00 AM, Gunnar Mills
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:60d44fed-74e2-70e3-e91f-ae1289d1700f@linux.vnet.ibm.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p><font face="Courier New, Courier, monospace">Hi All, <br>
          <br>
          This is a follow on to previous discussions of moving the GUI
          away from AngularJS and to a new framework, Vue, that was
          discussed on the list and in the GUI design workgroup meeting.<br>
          <br>
          See: <br>
          <a class="moz-txt-link-freetext"
href="https://lists.ozlabs.org/pipermail/openbmc/2019-September/018299.html"
            moz-do-not-send="true">https://lists.ozlabs.org/pipermail/openbmc/2019-September/018299.html</a><br>
          <a class="moz-txt-link-freetext"
            href="https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group"
            moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a><br>
          <br>
          The team here had some questions about Vue and wanted to
          answer some of our and the community concerns about moving to
          Vue, so over the last few weeks, our team has spent time
          working on a Vue prototype. If you are interested, <a
            class="moz-txt-link-freetext"
            href="https://github.com/gtmills/phosphor-webui-vue"
            moz-do-not-send="true">https://github.com/gtmills/phosphor-webui-vue</a><br>
          <br>
          This prototype has a few working panels and builds with the
          current webui recipe,
          <a class="moz-txt-link-freetext"
href="https://github.com/gtmills/openbmc/commit/de6e2daef54fa5ace473a42b9ff9014cc9cb02ba"
            moz-do-not-send="true">https://github.com/gtmills/openbmc/commit/de6e2daef54fa5ace473a42b9ff9014cc9cb02ba</a><br>
          <br>
          IBM is committed to moving the WebUI to Vue. <br>
          Is anyone opposed to moving to Vue?<br>
          <br>
          Should this work be done in a separate repo? <br>
          <br>
          Or a separate branch in phosphor-webui, that would be merged
          into the master branch once this Vue rewrite becomes
          functionally equivalent to the current AngularJS application?<br>
          <br>
          Would anyone stay on the current AngularJS application?<br>
          <br>
          We plan to maintain the current AngularJS application until
          the Vue rewrite becomes functionally equivalent, would anyone
          maintain the AngularJS application after such a time?<br>
          <br>
        </font><br>
      </p>
    </blockquote>
    <p><font face="Courier New, Courier, monospace"><br>
      </font><tt>I think a new repository is the safest bet here. </tt><tt><br>
      </tt><tt>Anyone opposed to a new repo for the webui vue rewrite? </tt><tt><br>
      </tt><tt><br>
      </tt><tt>Possible names: </tt><tt><br>
      </tt><tt>webui</tt><tt><br>
      </tt><tt>webui-v2</tt><tt><br>
      </tt><tt>phosphor-webui-v2</tt><tt><br>
      </tt><tt>phosphor-webui-vue</tt><tt><br>
      </tt><tt>webui-vue</tt><br>
    </p>
  </body>
</html>

--------------7FCEBD5C8D649EE336934255--

