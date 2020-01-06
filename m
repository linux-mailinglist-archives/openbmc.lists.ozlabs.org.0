Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C275B130F4D
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 10:19:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rqhW0HbhzDqF5
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 20:19:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rqgc3FD7zDq7g
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 20:18:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0069CtUN009273
 for <openbmc@lists.ozlabs.org>; Mon, 6 Jan 2020 04:18:33 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xaq7wrkgj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 04:18:32 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 6 Jan 2020 09:18:30 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Jan 2020 09:18:27 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0069IQ3k62586998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 09:18:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CEF14C04A;
 Mon,  6 Jan 2020 09:18:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4D144C046;
 Mon,  6 Jan 2020 09:18:25 +0000 (GMT)
Received: from [9.122.210.156] (unknown [9.122.210.156])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 09:18:25 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
To: Kun Yi <kunyi@google.com>
Subject: Re: *Request For Feedback*: TimeOwner in phosphor-timemanager
References: <18332622-cec4-37ae-b617-b897622d0ea2@linux.vnet.ibm.com>
 <FD0BD680739BFC41807C96BD23118BB1321C1D@ORSMSX113.amr.corp.intel.com>
 <8b717e60-5733-c3ef-13ad-7016e89f932a@linux.vnet.ibm.com>
 <20e2aaad-dd30-d9b2-36aa-d07b51f9732b@linux.vnet.ibm.com>
 <CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com>
 <257c3d82-f6a3-d793-70e7-d8ebec300c40@linux.vnet.ibm.com>
Date: Mon, 6 Jan 2020 14:48:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <257c3d82-f6a3-d793-70e7-d8ebec300c40@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------4CF45DFBAF1F53A5F95F368C"
X-TM-AS-GCONF: 00
x-cbid: 20010609-0016-0000-0000-000002DACE40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010609-0017-0000-0000-0000333D40C1
Message-Id: <02d18fa0-f9e2-2921-a56d-e76e4fc3b007@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_02:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060085
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Pine,
 Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4CF45DFBAF1F53A5F95F368C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Happy New Year ...

btw, looks like TimeOwner may not be of interest for the community ?. 
Shall we go ahead remove that setting ?

!! Vishwa !!

On 12/19/19 1:30 PM, vishwa wrote:
> On 12/19/19 1:29 AM, Kun Yi wrote:
>>
>
>>
>> On Wed, Dec 18, 2019 at 7:02 AM vishwa <vishwa@linux.vnet.ibm.com 
>> <mailto:vishwa@linux.vnet.ibm.com>> wrote:
>>
>>     Hello community,
>>
>>     Would be really great if there is any feedback on this.
>>
>>     Have a happy holidays !!
>>
>>     !! Vishwa !!
>>
>>     On 12/11/19 3:24 PM, vishwa wrote:
>>>     On 12/11/19 12:17 AM, Pine, Kathryn ElaineX wrote:
>>>>
>>>>     >*Do we need this going forward ?*: I am being asked by UX team
>>>>     about the need of this and I mentioned I would get the
>>>>     community feedback on this. Although, I feel this level of
>>>>     granularity gives control over how we can manage time, it would
>>>>     not justify the complexity if the customers don't appreciate
>>>>     it. Removing the TimeOwner would make the code a lot simpler.
>>>>
>>>>     Hi,
>>>>
>>>>     I am coming from the UX side of how we set the date time
>>>>     settings page up for phosphor-webui downstream recently. We
>>>>     switched our page to use Redfish, here’s how ours is set up now:
>>>>
>>>>     There is no longer a “time owner” and the setting is either:
>>>>
>>>>     NTPEnabled: true or false
>>>>
>>>>     If false, we are not allowing the user to set the time, because
>>>>     the BMC is synching from the host time and therefore any
>>>>     settings we made to the time on the BMC would be overwritten.
>>>>
>>>>     If true, we use the NTP server(s) the user provides.
>>>>
>>>>     We are testing this currently.
>>>>
>>>
>>>     Hi, Thank you for the response. From what I interpreted:
>>>
>>>     - TimeOwner is not settable via GUI
>>>     - Irrespective of NTP setting, the user is not allowed to set
>>>     the time on BMC
>>>     - BMC is syncing the time from Host.
>>>        - This means, the current TimeOwner is "Host" and NTP is off.
>>>     Is that being set as default ?
>>>
>>>     I am requesting for feedback from the community on the need of
>>>     TimeOwner feature that we have in Settings and timemanager code.
>>>
>>>     !! Vishwa !!
>>>>
>> My 2cents here along with a few questions:
>> - how does the current time manager interact with systemd-timesyncd?
>
> TimeManager interacts with systemd-timedated, which in turn engages 
> systemd-timesync on setting *NTP *policy.
> https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.service.html**
>
>> - From my experience, BMC time can drift a lot easily and it is more 
>> useful to have the BMC time synced externally
>
> This is a discussion point for using / not using NTP. It would not 
> impact TimeOwner
> https://github.com/openbmc/phosphor-time-manager/blob/master/README.md
>
>> - Whether NTP or host time is preferred should be left to the 
>> platform designer to decide
>
> If the setting is NTP, then Host can not set the time on BMC unless 
> the Owner is SPLIT.
> I believe, you are saying more from a NTP / Non NTP as opposed to 
> TimeOwner ?
>
>> - sounds like it would be more straightforward to have the 'Owner' 
>> reflect one time source: NTP/IPMI/Redfish
>
> This is part of TimeSynchronization. TimeOwner is another layer on who 
> owns the time as opposed to how the time is set.
> Hopefully the README I pointed to before would help.
>
> Thank you,
> !! Vishwa !!
>>
>> -- 
>> Regards,
>> Kun

--------------4CF45DFBAF1F53A5F95F368C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi,</div>
    <div class="moz-cite-prefix"><br>
      Happy New Year ... <br>
    </div>
    <div class="moz-cite-prefix"><br>
      btw, looks like TimeOwner may not be of interest for the community
      ?. Shall we go ahead remove that setting ?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">!! Vishwa !!<br>
      <br>
    </div>
    <div class="moz-cite-prefix">On 12/19/19 1:30 PM, vishwa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:257c3d82-f6a3-d793-70e7-d8ebec300c40@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      On 12/19/19 1:29 AM, Kun Yi wrote:<br>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <meta http-equiv="content-type" content="text/html;
          charset=UTF-8">
        <div dir="ltr">
          <div dir="ltr"><br>
          </div>
        </div>
      </blockquote>
      <br>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <div dir="ltr"><br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed, Dec 18, 2019 at
              7:02 AM vishwa &lt;<a
                href="mailto:vishwa@linux.vnet.ibm.com" target="_blank"
                moz-do-not-send="true">vishwa@linux.vnet.ibm.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF">
                <p>Hello community,<br>
                </p>
                <p>Would be really great if there is any feedback on
                  this.</p>
                <p>Have a happy holidays !!<br>
                </p>
                <p>!! Vishwa !!</p>
                <div>On 12/11/19 3:24 PM, vishwa wrote:<br>
                </div>
                <blockquote type="cite">
                  <div>On 12/11/19 12:17 AM, Pine, Kathryn ElaineX
                    wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div>
                      <p><span style="color:windowtext">&gt;</span><b>
                          Do we need this going forward ?</b>: I am
                        being asked by UX team about the need of this
                        and I mentioned I would get the community
                        feedback on this. Although, I feel this level of
                        granularity gives control over how we can manage
                        time, it would not justify the complexity if the
                        customers don't appreciate it. Removing the
                        TimeOwner would make the code a lot simpler.</p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">Hi,</span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext"> </span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">I am coming from the
                          UX side of how we set the date time settings
                          page up for phosphor-webui downstream
                          recently. We switched our page to use Redfish,
                          here’s how ours is set up now:</span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext"> </span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">There is no longer a
                          “time owner” and the setting is either:</span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">NTPEnabled: true or
                          false</span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">If false, we are not
                          allowing the user to set the time, because the
                          BMC is synching from the host time and
                          therefore any settings we made to the time on
                          the BMC would be overwritten. </span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">If true, we use the
                          NTP server(s) the user provides.</span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext"> </span></p>
                      <p class="MsoNormal"><span
                          style="color:windowtext">We are testing this
                          currently.</span></p>
                    </div>
                  </blockquote>
                  <div><br>
                    Hi, Thank you for the response. From what I
                    interpreted:<br>
                    <br>
                  </div>
                  <div>- TimeOwner is not settable via GUI<br>
                    - Irrespective of NTP setting, the user is not
                    allowed to set the time on BMC<br>
                    - BMC is syncing the time from Host.<br>
                       - This means, the current TimeOwner is "Host" and
                    NTP is off. Is that being set as default ?<br>
                  </div>
                  <div><br>
                    I am requesting for feedback from the community on
                    the need of TimeOwner feature that we have in
                    Settings and timemanager code.<br>
                  </div>
                  <div><br>
                    !! Vishwa !!<br>
                  </div>
                  <blockquote type="cite">
                    <div>
                      <p class="MsoNormal"><span
                          style="color:windowtext"><a
                            name="m_-4131239486451252847_m_691753059126936336______replyseparator"
                            moz-do-not-send="true"></a></span></p>
                    </div>
                  </blockquote>
                </blockquote>
              </div>
            </blockquote>
          </div>
          My 2cents here along with a few questions:
          <div>- how does the current time manager interact
            with systemd-timesyncd?<br>
          </div>
        </div>
      </blockquote>
      <div><br>
        TimeManager interacts with systemd-timedated, which in turn
        engages systemd-timesync on setting <strong>NTP </strong>policy.<br>
        <a class="moz-txt-link-freetext"
href="https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.service.html"
          moz-do-not-send="true">https://www.freedesktop.org/software/systemd/man/systemd-timesyncd.service.html</a><span
          class="command"><strong></strong></span><br>
        <br>
      </div>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <div dir="ltr">
          <div>
            <div>- From my experience, BMC time can drift a lot easily
              and it is more useful to have the BMC time synced
              externally</div>
          </div>
        </div>
      </blockquote>
      <div><br>
        This is a discussion point for using / not using NTP. It would
        not impact TimeOwner<br>
        <a class="moz-txt-link-freetext"
href="https://github.com/openbmc/phosphor-time-manager/blob/master/README.md"
          moz-do-not-send="true">https://github.com/openbmc/phosphor-time-manager/blob/master/README.md</a><br>
        <br>
      </div>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <div dir="ltr">
          <div>
            <div>- Whether NTP or host time is preferred should be left
              to the platform designer to decide</div>
          </div>
        </div>
      </blockquote>
      <div><br>
        If the setting is NTP, then Host can not set the time on BMC
        unless the Owner is SPLIT.<br>
        I believe, you are saying more from a NTP / Non NTP as opposed
        to TimeOwner ?<br>
        <br>
      </div>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <div dir="ltr">
          <div>
            <div>- sounds like it would be more straightforward to have
              the 'Owner' reflect one time source: NTP/IPMI/Redfish<br
                clear="all">
            </div>
          </div>
        </div>
      </blockquote>
      <div><br>
        This is part of TimeSynchronization. TimeOwner is another layer
        on who owns the time as opposed to how the time is set.<br>
        Hopefully the README I pointed to before would help.<br>
      </div>
      <div><br>
        Thank you,<br>
        !! Vishwa !!<br>
      </div>
      <blockquote type="cite"
cite="mid:CAGMNF6VnZdkWPUuZR2yThm43gCwxXDu0AVOJ3Wmi5UvOw2s9Sw@mail.gmail.com">
        <div dir="ltr">
          <div>
            <div>
              <div><br>
              </div>
              -- <br>
              <div dir="ltr">
                <div dir="ltr">Regards,
                  <div>Kun</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4CF45DFBAF1F53A5F95F368C--

