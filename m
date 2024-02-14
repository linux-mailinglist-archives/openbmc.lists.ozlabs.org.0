Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C412854261
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 06:31:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FADcv1+W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZRdG6qpNz3cDy
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 16:31:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FADcv1+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZRcg5ss9z2yQL
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 16:30:57 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3953302a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 21:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707888653; x=1708493453; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA+rr+n2Ukf8GRHG+FIeq6S2yZ640Dif9YTv0YQQ0J4=;
        b=FADcv1+W9c2DxMB3eyrjSTSIpbnYx7P8VLJVqZ+5MDECQdb0OZXrufrrxWXzks0VX+
         l3klHJCJo9TMIp0nGRf3WXdnHmYlrmiQh9OyMtAUhLsNRYXz4V4rNTOIA5Hl0mIFF4Ze
         0wu3o21i8b2h41IV2+Dg2wZHcJWDvyQcrCPc39PA4GhvqOJepKbxmseOqKaLliFl3LPg
         QvpJtdCfjt3pJzuTet1xrN7EsEi9t21hA6qikey6swH10kRbtWHYu520mK8o4UDZUMdL
         sl89IYtgHt8A82i9Qi/eWmLWcCr+nSSHS7WugfyrwQrU/NB9zKJ8wrYjrzR4w9IvMRPB
         Zh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707888653; x=1708493453;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZA+rr+n2Ukf8GRHG+FIeq6S2yZ640Dif9YTv0YQQ0J4=;
        b=ZS1qX8kEwnvJVrTFmiUwPBd106vQDud4/feLrHhNywGzCyBeXkT8YwGULWNx+3Y0nA
         6Y5RJMe6y1300Ko8bxqDvenzYWSj3TxZ1I7MIFd56HPBPxX64fhhef/ubpI6o9X8P2ng
         D2K8IP39NmpQbZ4mK37xCRcGpxdvg5QJD3UTWBw/S5MYNMDIwlSMF1m7TgrW/PO0Nktm
         6wUhdtqM/rFkwDZMwjiDzPH2Fzz3AVZvXxNCgM73QiC1qwFI5xBh12fuG/SCnrw7ksZi
         UxmWXSa38YZUAZ31kNxG/QF6u74S3cPIKsqLQpEgQkyo0kyzljMeG0wwOJfVzo9qmcKr
         +mSA==
X-Forwarded-Encrypted: i=1; AJvYcCUrCf8DRQUCs9am7fxKhr9pFeiv5wzZkHqXYJ4pgH762aOA1+yYcSBheaddXVihKkXfy3PhjQbSKG0PzlFPLBE0I+ZxSLuQEBg=
X-Gm-Message-State: AOJu0YzCUj7Z2AP6Qlf9Zk3mzLvGQQYo2o1a+TmfvCCK4h8zNbAv/NAY
	V/f0lkli8e1vaTukaeAwefeexIttNNgfHAsl18Ov+gxc4wLPfCve
X-Google-Smtp-Source: AGHT+IGd90KXJ4bfAJ222mstA4YcSPO8b9fhTPkBKAkKcCJHaU1uI1nakjNOQEAq0kZEsSPLR5S9Og==
X-Received: by 2002:a05:6a21:6315:b0:19e:4793:6263 with SMTP id wu21-20020a056a21631500b0019e47936263mr1804435pzb.52.1707888653364;
        Tue, 13 Feb 2024 21:30:53 -0800 (PST)
Received: from [192.168.0.102] ([106.51.171.185])
        by smtp.gmail.com with ESMTPSA id ee5-20020a17090afc4500b0029703476e9bsm452546pjb.44.2024.02.13.21.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 21:30:53 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------57Vr3ALgAYmMTLBFkK7QdDll"
Message-ID: <4d9dd481-4f60-4140-8c91-739b46be5c0e@gmail.com>
Date: Wed, 14 Feb 2024 11:00:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: File Manager Service in OpenBMC
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
 <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
 <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
 <874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au>
 <3862c106-d0c8-4168-bf22-ec9b8fba301a@gmail.com>
 <Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net>
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
Cc: gmills@us.ibm.com, geissonator@yahoo.com, openbmc@lists.ozlabs.org, ed@tanous.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------57Vr3ALgAYmMTLBFkK7QdDll
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

Thanks for the reply.

On 13/02/24 8:02 pm, Patrick Williams wrote:
> On Tue, Feb 13, 2024 at 12:14:49PM +0530, Sunitha Harish wrote:
>
>> I have mentioned the purpose of this usecase already. There is no more details that i can share.
> I think we're missing the high-level premise of what you're
> proposing.  Is this an arbitrary "expose the file system over dbus" or
> does it have some very specific purpose?  You've said something along
> the lines of "there are some files for the manage host", which is mostly
> fine if you don't want to talk about the details of them (even though
> they are supposedly already in bmcweb?) but I think there are still some
> more specifics you can talk to.

This is not exposing the whole file system over dbus. Specific persistent directory path only needs to be exposed.

Files content are not interpreted by BMC. They contain the system configuration details & resource data which gets loaded on top of the hypervisor.
These data are needed by the backup management console (redfish client) when it takes over the system management, when there is any failures on the
primary management console. IBM's management console implements the logic to read/write to these files, and only this client and the hypervisor understands the
format and data in this file.

>> Its not about implementing the file system on the BMC. Its implementing a systemd service, which will host the file descriptors as dbus
>> interfaces/properties. This will give file handler APIs to the redfish clients who are willing to do file operations on the BMC.
> My first read on this is that all it is doing is moving the problem from
> one place to another.  Fundamentally, the reason to not have bmcweb do
> file access is because of the potential security concerns.  Having a
> generic dbus service that reads and modifies the file system has the
> exact same security concerns, except now you've potentially lost all
> information as to _who_ is doing the file operation (unless you add who
> is doing the operation to the dbus interface).

Yes. Current implementation creates files with 700 permission. Only admin can upload the files.
In this app, there should be the validations for ensuring the security aspects. I will list them in design, and can be enhanced during review.
Adding the session id to the dbus would be a good audit data.

> If the proposal is "make a generic daemon that can expose the whole file
> system as a dbus-service", the answer is likely "no" due to all the
> security implications.  If there are specific files, folders, and/or
> configurable sets (which by default is a locked down set of nearly
> nothing) then "maybe"?  This is where it seems like people would need to
> see more details of what you're accomplishing.

I got it. Whole file system as a dbus-service is not expected here. This a specific persistent path at the BMC.
This can be thought as a small, limited sized storage place which can be shared between the redfish clients who are managing the BMC.

Regards,
Sunitha

--------------57Vr3ALgAYmMTLBFkK7QdDll
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Patrick,</pre>
    <pre>Thanks for the reply.
</pre>
    <div class="moz-cite-prefix">On 13/02/24 8:02 pm, Patrick Williams
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">On Tue, Feb 13, 2024 at 12:14:49PM +0530, Sunitha Harish wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I have mentioned the purpose of this usecase already. There is no more details that i can share.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think we're missing the high-level premise of what you're
proposing.  Is this an arbitrary "expose the file system over dbus" or
does it have some very specific purpose?  You've said something along
the lines of "there are some files for the manage host", which is mostly
fine if you don't want to talk about the details of them (even though
they are supposedly already in bmcweb?) but I think there are still some
more specifics you can talk to.
</pre>
    </blockquote>
    <pre>This is not exposing the whole file system over dbus. Specific persistent directory path only needs to be exposed.

Files content are not interpreted by BMC. They contain the system configuration details &amp; resource data which gets loaded on top of the hypervisor.
These data are needed by the backup management console (redfish client) when it takes over the system management, when there is any failures on the 
primary management console. IBM's management console implements the logic to read/write to these files, and only this client and the hypervisor understands the 
format and data in this file.
</pre>
    <blockquote type="cite"
      cite="mid:Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Its not about implementing the file system on the BMC. Its implementing a systemd service, which will host the file descriptors as dbus
interfaces/properties. This will give file handler APIs to the redfish clients who are willing to do file operations on the BMC.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My first read on this is that all it is doing is moving the problem from
one place to another.  Fundamentally, the reason to not have bmcweb do
file access is because of the potential security concerns.  Having a
generic dbus service that reads and modifies the file system has the
exact same security concerns, except now you've potentially lost all
information as to _who_ is doing the file operation (unless you add who
is doing the operation to the dbus interface).
</pre>
    </blockquote>
    <pre>Yes. Current implementation creates files with 700 permission. Only admin can upload the files.
In this app, there should be the validations for ensuring the security aspects. I will list them in design, and can be enhanced during review.
Adding the session id to the dbus would be a good audit data.
</pre>
    <blockquote type="cite"
      cite="mid:Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">
If the proposal is "make a generic daemon that can expose the whole file
system as a dbus-service", the answer is likely "no" due to all the
security implications.  If there are specific files, folders, and/or
configurable sets (which by default is a locked down set of nearly
nothing) then "maybe"?  This is where it seems like people would need to
see more details of what you're accomplishing.
</pre>
    </blockquote>
    <pre>I got it. Whole file system as a dbus-service is not expected here. This a specific persistent path at the BMC.
This can be thought as a small, limited sized storage place which can be shared between the redfish clients who are managing the BMC.
</pre>
    <blockquote type="cite"
      cite="mid:Zct9feAKEIiDonzu@heinlein.vulture-banana.ts.net">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre>Regards,
Sunitha
</pre>
  </body>
</html>

--------------57Vr3ALgAYmMTLBFkK7QdDll--
