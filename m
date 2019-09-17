Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D0B57E8
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 00:14:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xy886PQ4zF1kQ
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 08:14:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xy7T5lfwzF1KC
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 08:13:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HMCEL4039797; Tue, 17 Sep 2019 18:13:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v37ucrfqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 18:13:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HMAUtG024465;
 Tue, 17 Sep 2019 22:13:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2v37jw080f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 22:13:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HMDo1l51904818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 22:13:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4183A1360A8;
 Tue, 17 Sep 2019 22:13:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F09EC1360AC;
 Tue, 17 Sep 2019 22:13:49 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 22:13:49 +0000 (GMT)
Subject: Re: Updating BMC GUI Front End Framework
To: Derick Montague <Derick.Montague@ibm.com>, ed.tanous@intel.com,
 kuiying.wang@intel.com
References: <959CAFA1E282D14FB901BE9A7BF4E7724E5253FB@shsmsx102.ccr.corp.intel.com>
 <OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <cfc33111-4e2c-e46d-a4eb-4231168a9931@linux.vnet.ibm.com>
Date: Tue, 17 Sep 2019 17:13:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------04DA0E82E2524B8A23C01A81"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170207
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
Cc: openbmc@lists.ozlabs.org, deg.sse.openbmc@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------04DA0E82E2524B8A23C01A81
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/17/2019 3:46 PM, Derick Montague wrote:
>
>     Yes, it’s time to do it.
>

Derick, Thanks for starting the discussion on this! Kwin, Joseph thanks 
for your input!
Although we have time until AngularJS goes end of life, I agree we 
should start looking at moving away from AngularJS.

>     I suggest to use Vue, there are several reasons:
>
>     1. MIT license https://github.com/vuejs/vue/blob/dev/LICENSE
>     <https://github.com/vuejs/vue/blob/dev/LICENSE>
>
Angular and React are MIT as well.

>     2. The sizes of the libraries: Vue is about 80KB, much smaller
>     than Angular (500+KB), React(100KB).
>
I think some of the savings of Vue/React would be negated by the plugins 
we would need but agree this is a benefit.

>
>     3. It is already used by big internet company like Gitlab/Alibaba.
>
Google and Wix are some companies using Angular.
Facebook, Uber, Instagram, and Paypal, are some companies using React.


>     4. Vue is the most popular frameworks, according to the number of
>     stars on GitHub projects for Angular, React, and Vue.
>
>                                 Angular              React       Vue
>
>     # Watchers           3.3k                    3.7k     5.7k
>
>     # Stars                  43k                     71k       122k
>
>     # Forks                 11k                     16k       17k
>
I think your numbers are a little outdated.
If I look at the three projects, Vue has the most Stars, React has the 
most Watchers, Forks, and "Used by".

https://github.com/angular/angular
https://github.com/vuejs/vue
https://github.com/facebook/react

If I look at things like Google trends and npm trends, Vue does not 
score as highly as React.

https://trends.google.com/trends/explore?cat=31&q=Vue,%2Fm%2F012l1vxv,%2Fg%2F11c6w0ddw9 

https://www.npmtrends.com/react-vs-vue-vs-@angular/core

I agree though Vue.js has gained a lot of popularity since its launch in 
2014.


>     6. Vue is based on JS+HTML, it’s easy for existing AngularJS
>     developer to transfer, but not like Angular (TS) and React (JSX)\
>
I think what is easiest to move to is more complicated than that.

https://buildingvts.com/moving-on-from-angularjs-5417b79693a9

>     - Kwin
>
> Just adding a consensus of the 3 responders so far. Anyone else have 
> any feedback on the future front-end framework for the GUI?

I think any of these frameworks would work. I would like to see more 
discussion on this, specially around what benefits we are trying to gain.


--------------04DA0E82E2524B8A23C01A81
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/17/2019 3:46 PM, Derick Montague
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <div dir="ltr"> </div>
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p>Yes, it’s time to do it.</p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Derick, Thanks for starting the discussion on this! Kwin, Joseph
    thanks for your input! <br>
    Although we have time until AngularJS goes end of life, I agree we
    should start looking at moving away from AngularJS.<br>
    <br>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p><o:p></o:p></p>
            <p>I suggest to use Vue, there are several reasons:<o:p></o:p></p>
            <p><!--[if !supportLists]-->1. MIT license <a
                href="https://github.com/vuejs/vue/blob/dev/LICENSE"
                target="_blank" moz-do-not-send="true">
                https://github.com/vuejs/vue/blob/dev/LICENSE<br>
              </a></p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p>Angular and React are MIT as well.<br>
      <br>
    </p>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p><o:p></o:p></p>
            <p><!--[if !supportLists]-->2. The sizes of the libraries:
              Vue is about 80KB, much smaller than Angular (500+KB),
              React(100KB).</p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p>I think some of the savings of Vue/React would be negated by the
      <span class="c-message__body" dir="auto" data-qa="message-text">plugins
        we would need but agree this is a benefit.</span><span
        class="c-message__body" dir="auto" data-qa="message-text"><br>
        <br>
      </span></p>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p><br>
            </p>
            <p><!--[if !supportLists]-->3. It is already used by big
              internet company like Gitlab/Alibaba.</p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p>Google and Wix are some companies using Angular.<br>
      Facebook, Uber, Instagram, and Paypal, are some companies using
      React.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p><o:p></o:p></p>
            <p><!--[if !supportLists]-->4. Vue is the most popular
              frameworks, according to the number of stars on GitHub
              projects for Angular, React, and Vue.<o:p></o:p></p>
            <p>                            Angular              React   
                    Vue<o:p></o:p></p>
            <p># Watchers           3.3k                    3.7k       
                  5.7k<o:p></o:p></p>
            <p># Stars                  43k                     71k     
                    122k<o:p></o:p></p>
            <p># Forks                 11k                     16k     
                    17k</p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p>I think your numbers are a little outdated. <br>
      If I look at the three projects, Vue has the most Stars, React has
      the most Watchers, Forks, and "Used by".<br>
      <br>
      <a class="moz-txt-link-freetext" href="https://github.com/angular/angular">https://github.com/angular/angular</a><br>
      <a class="moz-txt-link-freetext" href="https://github.com/vuejs/vue">https://github.com/vuejs/vue</a><br>
      <a class="moz-txt-link-freetext" href="https://github.com/facebook/react">https://github.com/facebook/react</a><br>
      <br>
      If I look at things like Google trends and npm trends, Vue does
      not score as highly as React.<br>
      <br>
<a class="moz-txt-link-freetext" href="https://trends.google.com/trends/explore?cat=31&amp;q=Vue,%2Fm%2F012l1vxv,%2Fg%2F11c6w0ddw9">https://trends.google.com/trends/explore?cat=31&amp;q=Vue,%2Fm%2F012l1vxv,%2Fg%2F11c6w0ddw9</a>
      <br>
      <a class="moz-txt-link-freetext" href="https://www.npmtrends.com/react-vs-vue-vs-@angular/core">https://www.npmtrends.com/react-vs-vue-vs-@angular/core</a><br>
    </p>
    <p>I agree though Vue.js has gained a lot of popularity since its
      launch in 2014.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <p><o:p></o:p><!--[if !supportLists]--></p>
            <p>6.      
              <!--[endif]-->Vue is based on JS+HTML, it’s easy for
              existing AngularJS developer to transfer, but not like
              Angular (TS) and React (JSX)\</p>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <p>I think what is easiest to move to is more complicated than that.
      <br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://buildingvts.com/moving-on-from-angularjs-5417b79693a9">https://buildingvts.com/moving-on-from-angularjs-5417b79693a9</a><br>
      <br>
    </p>
    <blockquote type="cite"
cite="mid:OFBF5B996D.FFFAE8E7-ON00258478.00712980-00258478.007222FC@notes.na.collabserv.com">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Lucida Sans Unicode, Lucida Grande,
        sans-serif;font-size:10pt">
        <blockquote data-history-content-modified="1"
          data-history-expanded="1" dir="ltr" style="border-left:solid
          #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr;
          margin-right:0px">
          <div>
            <div>- Kwin</div>
            <p style="text-indent: -0.25in; margin: 0px 0px 0px 36pt;"><o:p></o:p></p>
            <p style="margin: 0px;"><o:p> </o:p><o:p></o:p></p>
          </div>
        </blockquote>
        <div dir="ltr">Just adding a consensus of the 3 responders so
          far. Anyone else have any feedback on the future front-end
          framework for the GUI?</div>
      </div>
    </blockquote>
    <p>I think any of these frameworks would work. I would like to see
      more discussion on this, specially around what benefits we are
      trying to gain.<br>
    </p>
  </body>
</html>

--------------04DA0E82E2524B8A23C01A81--

